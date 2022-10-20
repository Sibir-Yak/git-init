class Route
  attr_reader :stations        #Может выводить список всех станций по-порядку от начальной до конечной
  def initialize(station, station2)   #Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
    # @station = []
    # @station << station
    # @station << station2
    @stations = [station, station2]
  end

  def add_station(point)       #Может добавлять промежуточную станцию в список
    @stations.insert(-2, point)
  end

  def delete_station(point)    #Может удалять промежуточную станцию из списка
    if point == @stations[0]
      puts "Первую станцию не удаляем"
    elsif point == @stations[-1]
      puts "Последнюю тоже не удаляем"
    else
    # @station.tap { |hs| hs.delete(point) }
    @stations.delete(point)
    end
  end 

  # def station
  #   @station
  # end
  #метот позволяет вставить в нужную позицию станцию a.insert(-2, 3) в данном случае предпоследним
end