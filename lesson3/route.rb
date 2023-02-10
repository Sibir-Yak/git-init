class Route
  include InstanceCounter

  attr_reader :stations        #Может выводить список всех станций по-порядку от начальной до конечной
  def initialize(station, station2)   #Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
    @stations = [station, station2]
    register_instance
    validate!
  end

  def validate!
    raise LessThanTwoStationsError if @stations.size < 2
    raise LessThanTwoStationsError if @stations.include?(nil)
  end

  def add_station(point)       #Может добавлять промежуточную станцию в список
    @stations.insert(-2, point)
  end

  def add_name_route
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