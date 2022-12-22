class Station
  include InstanceCounter
  attr_reader :names, :trains      #Может возвращать список всех поездов на станции, находящиеся в текущий момент
  
  # Создаем переменную масив станцій 
  @@instances_station = []

  def initialize(names)   #Имеет название, которое указывается при ее создании
    @names = names 
    @trains = []
    @@instances_station << self
    add_instance
  end
  # Метот вывода всех станций в класса
  def self.all
    @@instances_station
  end

  loading '|                                       |', 'loading... station.rb' 
  sleep 1
  loading '|||||                                   |', 'loading... train.rb' 
  sleep 1
  loading '||||||||||                              |', 'loading... station.rb' 
  sleep 1
  loading '||||||||||||||||||                      |', 'loading... route.rb' 
  sleep 1
  loading '||||||||||||||||||||                    |', 'loading... wagon.rb' 
  sleep 0.5
  loading '|||||||||||||||||||||||||||             |', 'loading... Всякое Гавно' 
  sleep 1.5
  loading '|||||||||||||||||||||||||||||||||||     |', 'loading... Остальные БАГИ & ГЛЮКИ' 
  sleep 2
  loading '|||||||||||||||||||||||||||||||||||||||||', 'loading... !!!!СПРАВИЛИСЬ!!!'

  def train_type2    #Возвращаем список поездов на станции по типу
    puts "Пасажирских #{ @trains.select { |tr| tr.is_a?(TrainPass)}.size }"  #Перебираем с условием 
    puts "Грузовых #{ @trains.reject { |tr| tr.is_a?(TrainPass) }.size }"     #Перебираем с антиусловием    
  end # rr.stations[0].train_type2

  # def train_type(type)     #Возвращаем список поездов на станции по типу    
  #   @trains.each do |train|
  #     if train.type == type
  #       puts "По указанному вами типу #{type}, есть такие поезда #{train}"
  #       puts "Его номер #{train.number}"
  #       puts "У  него #{train.wagons} вагонов"
  #     end
  #   end
  # end

  def add_train(train)      #Добавляем поезда
    @trains << train
  end

  def train_go(train)     #Отправляем поезда
    @trains.delete(train)
  end 

end
