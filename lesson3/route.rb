# frozen_string_literal: true

class Route
  include InstanceCounter
  include Valid

  attr_reader :stations # Может выводить список всех станций по-порядку от начальной до конечной

  # Имеет начальную и конечную станцию, а также список промежуточных станций.
  # Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(station, station2)
    @stations = [station, station2]
    validate!
    register_instance
  end

  def validate!
    raise LessThanTwoStationsError if @stations.size < 2
    raise LessThanTwoStationsError if @stations.include?(nil)
    raise ObjectTypeError unless @stations[0].is_a?(Station) && @stations[1].is_a?(Station)
  end

  # Может добавлять промежуточную станцию в список
  def add_station(point)
    raise ObjectTypeError unless point.is_a?(Station)

    @stations.insert(-2, point)
  end

  def showing_stations
    stations.map(&:name).join('->')
    # name_route = ""
    # @stations.each do |name|
    #   name_route += "->" + name.name
    # end
    # puts name_route
  end

  # Может удалять промежуточную станцию из списка
  def delete_station(point)
    raise TrainStationNowError if  point.trains.any?
    raise FirstStationDestroyError if point == stations[0]
    raise LastStationDestroyError if point == stations[-1]

    @stations.delete(point)
  end
end
