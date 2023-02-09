class Train
  include BrandName
  include InstanceCounter

  attr_reader :number, :speed, :wagons, :route, :now_station
  NUMBER_TRAIN = /^[a-z0-9]{3}-[a-z0-9]{2}$/i
  @@all_trains = []

  def initialize(number)       #Имеет номер (произвольная строка)
    @speed = 0
    @number = number
    validate!
    @wagons = []
    @now_station = nil
    @route = nil
    @station_index = 0
    @@all_trains << self
    register_instance
  end

  def validate!
    raise TrainNumberNilError if @number.nil?
    raise TrainNumberFormatError if @number !~ NUMBER_TRAIN
    raise TrainNumberNotUniqError if @@all_trains.find { |a| a.number == @number }
  end

  def self.find(number_train)
    @@all_trains.find{ |a| a.number == number_train}
  end

  def speed_up(speed)            #Может набирать скорость
    if  speed > 0 && speed < 200
      @speed += speed
    end
  end

  def speed_down(speed)
    if speed >= 0  && speed < @speed
      @speed -= speed
    else
      stop
    end
  end

  def stop           #Может тормозить (сбрасывать скорость до нуля)
    @speed = 0
  end

  def docking(wagon)         #стыковка  вагона
    @wagons << wagon
  end

  def current_station
    @route.stations[@station_index].name
  end

  def next_station
    if @station_index < @route.stations.size - 1
      @route.stations[@station_index+1].name
    end
  end

  def previous_station
    if @station_index >= 1
      @route.stations[@station_index-1].name
    end
  end

  def undocking       #расстыковка вагона
    if @speed == 0 && @wagons.any?
      @wagons.delete_at(0)
    end
  end

  def add_route(route)   #Правильно
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
    if @station_index < @route.stations.size - 1
      @station_index += 1
      @route.stations[@station_index - 1].train_go(self)   #Кикаем паравоз
      @route.stations[@station_index].add_train(self)
      @now_station = @route.stations[@station_index].name
    else
      error = 0
    end
    raise LastStationError if error == 0
  end

  def go_previous_station          #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно  назад, но только на 1 станцию за раз
    # Создать исключение на базе проверки на нулевую ( несуществующую станцию)
    if @station_index >= 1
    @station_index -= 1
    @route.stations[@station_index + 1].train_go(self)   #Кикаем паравоз
    @route.stations[@station_index].add_train(self)
    @now_station = @route.stations[@station_index].name
    else
      error = 1
    end
    raise FirstStationError if error == 1
  end
end


