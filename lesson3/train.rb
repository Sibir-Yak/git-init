class Train
  include BrandName
  include InstanceCounter
  include Valid

  attr_reader :number, :speed, :wagons, :route, :now_station
  NUMBER_FORMAT = /^[a-z0-9]{3}-*[a-z0-9]{2}$/i
  @@all_trains = []

  def initialize(number)       #Имеет номер (произвольная строка)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @now_station = nil
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
    raise TrainWagonNilError if @wagons.empty?
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

  # def add_route(route)   #Не правильно
  #   @route = route
  #   puts @route.stations[0].name
  #   @route.stations[0].add_train(self)
  # end

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
end


