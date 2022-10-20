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
    @station_index = 0
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
      # puts "Ваш параметр приводит к полной остановке"
      # @speed = 0
      stop
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
    puts "Вы сейчас на первой станции #{@route.stations[0].names}"
    @route.stations[0].add_train(self)
  end

  def go_next_station              #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед, но только на 1 станцию за раз
    if @station_index < @route.stations.size-1
    @station_index +=1
    # stat = @station_index - 1
    # puts "XXX #{@route.station[@station_index]}"
    @route.stations[@station_index - 1].train_go(self)   #Кикаем паравоз
    @route.stations[@station_index].add_train(self)   
    puts "Вы на станции #{@route.stations[@station_index].names}"
    else
      puts "Вы на последней станции"
    end
  end

  def go_previous_station          #Может перемещаться между станциями, указанными в маршруте. Перемещение возможно  назад, но только на 1 станцию за раз
    if @station_index >= 1 
    @station_index -=1
    # stat = @station_index - 1
    # puts "XXX #{@route.station[@station_index]}"
    @route.stations[@station_index + 1].train_go(self)   #Кикаем паравоз
    @route.stations[@station_index].add_train(self)
    puts "Вы на станции #{@route.stations[@station_index].names}"
    else
      puts "Вы на первой станции"
    end
    
  end

  def next_station
    if @station_index < @route.stations.size-1   #@station_index >= 0 &&
      puts "Следущая станция #{@route.stations[@station_index+1].names}"
    else
      puts "Вы на последней, следующей станции нет"
    end
    
  end

  def current_station
    # if @station_index >= 0
    #   puts "Текущая станция #{@route.stations[@station_index].names}"
    # end
    puts "Текущая станция #{@route.stations[@station_index].names}"    
  end

  def previous_station
    if @station_index >= 1
      puts "Предыдущая станция #{@route.stations[@station_index-1].names}"
    else
      puts "Вы на первойстанции, предыдущей нет"
    end
  end
end



  # def next_prev_st       #Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

  #   if @station_index >= 1
  #      puts "Предыдущая станция #{@route.station[@station_index-1].names}"
  #   end
  #   if @station_index >= 0
  #      puts "Текущая станция #{@route.station[@station_index].names}"
  #   end
  #   if @station_index >= 0 && @station_index < @route.station.size-1
  #       puts "Следущая станция #{@route.station[@station_index+1].names}"
  #   end
  # end

