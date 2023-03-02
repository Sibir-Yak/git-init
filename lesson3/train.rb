class Train
  include BrandName
  include InstanceCounter
  include Valid

  attr_reader :number, :speed, :wagons, :route
  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i
  @@all_trains = []

  def initialize(number)       #Имеет номер (произвольная строка)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @route = nil
    @station_index = 0
    @@all_trains << self
    register_instance
  end

  def validate!
    raise TrainNumberNilError if @number.nil?
    raise TrainNumberFormatError if @number !~ NUMBER_FORMAT
    raise TrainNumberNotUniqError if @@all_trains.reject{ |train| train == self }.find{ |a| a.number == @number }   #Берем все созданные трейн и находим в каждом @номер когда совпадение то ошибка.
  end

  def self.find(number_train)
    @@all_trains.find{ |a| a.number == number_train}
  end

  def speed_up(speed)            #Может набирать скорость
    raise NegativeSpeedError if speed < 0
    raise CrazySpeedError if speed > 200

    @speed += speed
  end

  def speed_down(speed)
    raise NegativeSpeedError if speed < 0
    raise StopStandingError if @speed == 0

    if speed < @speed
      @speed -= speed
    else
      stop
    end
  end

  def stop           #Может тормозить (сбрасывать скорость до нуля)
    raise StopStandingError if @speed == 0
    @speed = 0
  end

  def docking(wagon)         #стыковка  вагона
    raise TrainRunError if @speed != 0
    @wagons << wagon
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    if @station_index < @route.stations.size - 1
      @route.stations[@station_index+1]
    end
  end

  def previous_station
    if @station_index >= 1
      @route.stations[@station_index-1]
    end
  end

  def undocking       #расстыковка вагона
    raise TrainWagonEmptyError if @wagons.empty?
    raise TrainRunError if @speed != 0

    @wagons.delete_at(0)
  end

  def add_route(route)   #Правильно
    raise ObjectTypeError unless route.is_a?(Route)

    @route = route
    start_station = @route.stations[0]
    start_station.add_train(self)

    start_station
  end

  def go_next_station              #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед, но только на 1 станцию за раз
    raise LastStationError unless next_station

    current_station.train_go(self)   #Кикаем паравоз
    next_station.add_train(self)
    @station_index += 1
  end

  def go_previous_station                                #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно  назад, но только на 1 станцию за раз
    raise FirstStationError unless previous_station      #Ошибка выводит иформацию завершает действие

    current_station.train_go(self)   #Кикаем паравоз
    previous_station.add_train(self)      #Добавляем паровоз
    @station_index -= 1
  end
# написать метод, который принимает блок и проходит по всем вагонам поезда
# (вагоны должны быть во внутреннем массиве),
# передавая каждый объект вагона в блок.
  def list_wagons_trains(train, &block)
    number = 0
    train.wagons.each do |wagon|
      number += 1
      type_wagon = wagon.class.to_s[5..9]
      free_volume = wagon.free
      busy_volume = wagon.busy
      yield(number, type_wagon, free_volume, busy_volume)
    end
  end
end

# @trains.each do |train|
#   # yield("Станция-> " + train.current_station.name.to_s)
#   # yield(";   Номер-> " + train.number)
#   # yield(";   Тип-> " + train.class.to_s[5..8])
#   # yield(";   Количество вагонов-> " + train.wagons.size.to_s)
#   # puts
#   a = train.current_station.name.to_s
#   b = train.number
#   c = train.class.to_s[5..8]
#   d = train.wagons.size.to_s
#   yield(a, b, c, d)