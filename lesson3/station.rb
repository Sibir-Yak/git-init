class Station      
  attr_reader :names, :trains      #Может возвращать список всех поездов на станции, находящиеся в текущий момент
  
  def initialize(names)   #Имеет название, которое указывается при ее создании
    @names = names 
    @trains = []
  end

  def train_type2    #Возвращаем список поездов на станции по типу
    puts "Пасажирских #{ @trains.select { |tr| tr.type == "pas" }.size }"  #Перебираем с условием 
    puts "Грузовых #{ @trains.reject { |tr| tr.type == "pas" }.size }"     #Перебираем с антиусловием    
  end 

  def train_type(type)     #Возвращаем список поездов на станции по типу    
    @trains.each do |train|
      if train.type == type
        puts "По указанному вами типу #{type}, есть такие поезда #{train}"
        puts "Его номер #{train.number}"
        puts "У  него #{train.wagons} вагонов"
      end
    end
  end

  protected
  # Методы далее не будут вызываться из клиентсокго кода, только через интерфейс.

  def add_train(train)      #Добавляем поезда
    @trains << train
  end

  def train_go(train)     #Отправляем поезда
    @trains.delete(train)
  end 

end
