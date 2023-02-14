class Station
  include InstanceCounter
  include Valid

  attr_reader :name, :trains      #Может возвращать список всех поездов на станции, находящиеся в текущий момент
  # Создаем переменную масив станцій
  @@object_station = []

  def initialize(name)   #Имеет название, которое указывается при ее создании
    @name = name
    validate!
    @trains = []
    @@object_station << self
    register_instance
  end

  def validate!
    raise StationNameError unless @name =~ /[a-z]+\d*/i || @name.nil?
  end
  # Метот вывода всех станций в класса
  def self.all
    @@object_station
  end

  def add_train(train)      #Добавляем поезда
    raise ObjectTypeError unless train.is_a?(Train)
    @trains << train
  end

  def train_go(train)     #Отправляем поезда
    raise ObjectTypeError unless train.is_a?(Train)
    @trains.delete(train)
  end

  # def train_type2    #Возвращаем список поездов на станции по типу
  #   puts @trains.select { |tr| tr.is_a?(TrainPass)}.size  #Перебираем с условием
  #   puts @trains.select { |tr| tr.is_a?(TrainCargo)}.size
  # end

end
