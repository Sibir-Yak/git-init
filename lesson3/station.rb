class Station      
  attr_reader :names, :trains      #Может возвращать список всех поездов на станции, находящиеся в текущий момент
  
  def initialize(names)   #Имеет название, которое указывается при ее создании
    @names = names
    # @trains = {}  
    @trains = []
  end

  def add_train(train)      #Добавляем поезда
    @trains << train
  end


  def train_type2    #Возвращаем список поездов на станции по типу
    puts "Пасажирских #{ @trains.select { |tr| tr.type == "pas" }.size }"  #Перебираем с условием 
    puts "Грузовых #{ @trains.reject { |tr| tr.type == "pas" }.size }"     #Перебираем с антиусловием    
  end 

  def train_type(viev)     #Возвращаем список поездов на станции по типу    
    # pas = 0
    # gruz = 0
    # @trains.each do |tr|
    #   if tr.type == "pas" 
    #     pas += 1
    #   else
    #     gruz += 1
    #   end 
    # end
    # puts "Грузовых поездо:#{gruz} Пасажирскмх поездов:#{pas}"

    @trains.each do |tr|
      if tr.type == viev
      puts "По указанному вами типу #{viev}, есть такие поезда #{tr}"
      puts "Его номер #{tr.number}"
      puts "У  него #{tr.wagons} вагонов"
      end
    end
  end

  # def train
  #   puts @trains
  # end

  def train_go(train)     #Отправляем поезда
    @trains.delete(train)
    # station 
    # @trains.tap { |hs| hs.delete(num) }
  end 

end
