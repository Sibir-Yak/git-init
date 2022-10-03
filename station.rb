class Station
  attr_accessor :train      #Может возвращать список всех поездов на станции, находящиеся в текущий момент
  attr_reader :names_station
  
  def initialize(names_station)   #Имеет название, которое указывается при ее создании
    @names_station = names_station
    # @train = {}  
    @train = []
  end

  def add_train(train)      #Добавляем поезда
    @train << train
  end


  def train_type2    #Возвращаем список поездов на станции по типу
    puts "Пасажирских #{ @train.select { |tr| tr.type == "pas" }.size }"  #Перебираем с условием 
    puts "Грузовых #{ @train.reject { |tr| tr.type == "pas" }.size }"     #Перебираем с антиусловием    
  end 

  def train_type     #Возвращаем список поездов на станции по типу
    # @train.select {|tr| tr.type == }
    pas = 0
    gruz = 0
    @train.each do |tr|
      if tr.type == "pas" 
        pas += 1
      else
        gruz += 1
      end 
    end
    puts "Грузовых поездо:#{gruz} Пасажирскмх поездов:#{pas}"
  end

  # def train
  #   puts @train
  # end

  def train_go(train)     #Отправляем поезда
    @train.delete(train)
    # station 
    # @train.tap { |hs| hs.delete(num) }
  end 

end
