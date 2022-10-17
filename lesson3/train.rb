class Train
  attr_reader :number, :speed, :wagons, :type, :route  #Может возвращать текущую скорость
                                                       #Может возвращать количество вагонов

  def initialize(number, type, num_wagons)       #Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
    @speed = 0
    @number = number      
    @type = type
    # @train = {}
    # @train[number] = type
    @wagons = num_wagons
    @route = nil
    @num_station = 0
  end

  def speed_up(speed)            #Может набирать скорость
    if  speed > 0 
      @speed += speed
      puts "Скорость стала больше на #{speed} км.ч."
    else
      puts "Выберете скорость от 1 до жуя"
    end
  end

  def speed_down(speed)
    if speed >= 0  && speed < @speed
      @speed -= speed
      puts "Скорость стала меньше на #{speed} км.ч."
    else
      puts "Ваш параметр приводит к полной остановке"
      @speed = 0
    end
  end

  def stop           #Может тормозить (сбрасывать скорость до нуля)
    @speed = 0 
    puts "Поезд остановлен"  
  end


  def docking         #стыковка  вагонов
    if @speed == 0 
      @wagons += 1
      puts "Вагончик добавлен"
    else 
      puts "Поезд в движении, стыковка неможлива"
    end
  end

  def undocking       #расстыковка вагона
    if @speed == 0 && @wagons > 0
      @wagons -= 1
      puts "Вагончик отбавлен"
    else 
      puts "Поезд в движении, расстыковка неможлива"
    end    
  end
    
  def add_route(route)   #Назначаем маршрут
    @route = route
    puts "Вы сейчас на первой станции #{@route.station[0].names_station}"
    @route.station[0].add_train(self)
  end

  def go_next_station              #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед, но только на 1 станцию за раз
    if @num_station < @route.station.size-1
    @num_station +=1
    # stat = @num_station - 1
    # puts "XXX #{@route.station[@num_station]}"
    @route.station[@num_station].add_train(self)
    @route.station[@num_station - 1].train_go(self)   #Кикаем паравоз
    puts "Вы на станции #{@route.station[@num_station].names_station}"
    else
      puts "Вы на последней станции"
    end
  end

  def go_previous_station          #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно  назад, но только на 1 станцию за раз
    if @num_station >= 1 
    @num_station -=1
    # stat = @num_station - 1
    # puts "XXX #{@route.station[@num_station]}"
    @route.station[@num_station].add_train(self)
    @route.station[@num_station + 1].train_go(self)   #Кикаем паравоз
    puts "Вы на станции #{@route.station[@num_station].names_station}"
    else
      puts "Вы на первой станции"
    end
    
  end

  def next_station
    if @num_station >= 0 && @num_station < @route.station.size-1
      puts "Следущая станция #{@route.station[@num_station+1].names_station}"
    else
      puts "Вы на последней, следующей станции нет"
    end
    
  end

  def current_station
    if @num_station >= 0
      puts "Текущая станция #{@route.station[@num_station].names_station}"
    end    
  end

  def previous_station
    if @num_station >= 1
      puts "Предыдущая станция #{@route.station[@num_station-1].names_station}"
    else
      puts "Вы на первойстанции, предыдущей нет"
    end
  end
end



  # def next_prev_st       #Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

  #   if @num_station >= 1
  #      puts "Предыдущая станция #{@route.station[@num_station-1].names_station}"
  #   end
  #   if @num_station >= 0
  #      puts "Текущая станция #{@route.station[@num_station].names_station}"
  #   end
  #   if @num_station >= 0 && @num_station < @route.station.size-1
  #       puts "Следущая станция #{@route.station[@num_station+1].names_station}"
  #   end
  # end

