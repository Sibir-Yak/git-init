# frozen_string_literal: true

class Train
  include BrandName
  include InstanceCounter
  include Valid

  attr_reader :number, :speed, :wagons, :route

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze
  @@all_trains = []

  # Имеет номер (произвольная строка)
  def initialize(number)
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

    # Берем все созданные трейн и находим в каждом @номер когда совпадение то ошибка.
    existing_trains = @@all_trains.select do |train|
      train != self && train.number == @number
    end
    raise TrainNumberNotUniqError if existing_trains.any?
  end

  def self.find(number_train)
    @@all_trains.find { |a| a.number == number_train }
  end

  # Может набирать скорость
  def speed_up(speed)
    raise NegativeSpeedError if speed.negative?
    raise CrazySpeedError if speed > 200

    @speed += speed
  end

  def speed_down(speed)
    raise NegativeSpeedError if speed.negative?
    raise StopStandingError if @speed.zero?

    if speed < @speed
      @speed -= speed
    else
      stop
    end
  end

  # Может тормозить (сбрасывать скорость до нуля)
  def stop
    raise StopStandingError if @speed.zero?

    @speed = 0
  end

  # стыковка  вагона
  def docking(wagon)
    raise TrainRunError if @speed != 0

    @wagons << wagon
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1] if @station_index < @route.stations.size - 1
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index >= 1
  end

  # расстыковка вагона
  def undocking
    raise TrainWagonEmptyError if @wagons.empty?
    raise TrainRunError if @speed != 0

    @wagons.delete_at(0)
  end

  # Правильно
  def add_route(route)
    raise ObjectTypeError unless route.is_a?(Route)

    @route = route
    start_station = @route.stations[0]
    start_station.add_train(self)

    start_station
  end

  # Может перемещаться между станциями, указ. в маршруте. Перемещ. возможно вперед, но только на 1 станцию за раз
  def go_next_station
    raise LastStationError unless next_station

    current_station.train_go(self) # Кикаем паравоз
    next_station.add_train(self)
    @station_index += 1
  end

  # Может перемещаться между станциями, указ. в маршруте. Перемещ. возможно  назад, но только на 1 станцию за раз
  def go_previous_station
    raise FirstStationError unless previous_station # Ошибка выводит инфу завершает действие

    current_station.train_go(self) # Кикаем паравоз
    previous_station.add_train(self) # Добавляем паровоз
    @station_index -= 1
  end

  # написать метод, который принимает блок и проходит по всем вагонам поезда
  # (вагоны должны быть во внутреннем массиве),
  # передавая каждый объект вагона в блок.
  def list_wagons_trains
    number = 0
    wagons.each do |wagon|
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
