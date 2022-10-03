class Route
  attr_reader :station        #Может выводить список всех станций по-порядку от начальной до конечной
  def initialize(station, station2)   #Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
    @station = []
    @station << station
    @station << station2

  end

  def add_station(stat)       #Может добавлять промежуточную станцию в список
    @station.insert(-2, stat)
  end

  def delete_station(stat)    #Может удалять промежуточную станцию из списка
    
    @station.tap { |hs| hs.delete(stat) }
  end 

  # def station
  #   @station
  # end
  #метот позволяет вставить в нужную позицию станцию a.insert(-2, 3) в данном случае предпоследним
end