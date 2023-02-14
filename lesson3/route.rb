class Route
  include InstanceCounter
  include Valid

  attr_reader :stations        #Может выводить список всех станций по-порядку от начальной до конечной
  def initialize(station, station2)   #Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
    @stations = [station, station2]
    validate!
    register_instance
  end

  def validate!
    raise LessThanTwoStationsError if @stations.size < 2
    raise LessThanTwoStationsError if @stations.include?(nil)
    raise ObjectTypeError unless @stations[0].is_a?(Station) && @stations[1].is_a?(Station)
    # raise ObjectTypeError unless @stations.include?(is_a?(Station))
  end

  def add_station(point)       #Может добавлять промежуточную станцию в список
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

  def delete_station(point)    #Может удалять промежуточную станцию из списка
    raise TrainStationNowError if  point.trains.any?
    raise FirstStationDestroyError if point == stations[0]
    raise LastStationDestroyError if point == stations[-1]

    @stations.delete(point)
  end
end