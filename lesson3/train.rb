class Train
  attr_reader :number, :speed, :wagons, :type, :route  #Может возвращать текущую скорость #Может возвращать количество вагонов
                                                       
#При добавлении вагона к поезду, объект вагона должен передаваться как аргумент метода 
#и сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, 
#где мы считали только кол-во вагонов.
# Параметр конструктора "кол-во вагонов" при этом можно удалить.
  def initialize(number, type)       #Имеет номер (произвольная строка) и тип (грузовой, пассажирский) 
    @speed = 0
    @number = number      
    @type = type
    @wagons = []
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

  def current_station
    puts "Текущая станция #{@route.stations[@station_index].names}"    
  end

  def next_station
    if @station_index < @route.stations.size-1  
      puts "Следущая станция #{@route.stations[@station_index+1].names}"
    else
      puts "Вы на последней, следующей станции нет"
    end
    
  end

  def previous_station
    if @station_index >= 1
      puts "Предыдущая станция #{@route.stations[@station_index-1].names}"
    else
      puts "Вы на первойстанции, предыдущей нет"
    end
  end

  protected
# Методы далее не будут вызываться из клиентсокго кода, только через интерфейс.

  def docking(wagon)         #стыковка  вагона
    if @speed == 0 
      @wagons << wagon
      puts "Вагончик добавлен"
    else 
      puts "Поезд в движении, стыковка неможлива"
    end
  end

  def undocking       #расстыковка вагона
    if @speed == 0 && @wagons.any?
      @wagons.delete_at(0)
      puts "Вагончик отбавлен"
      puts "вагонов осталось #{@wagons.size}"
    elsif @speed > 0
      puts "Поезд в движении, расстыковка неможлива"
    else
      puts "Вагоны усё"
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
    @route.stations[@station_index + 1].train_go(self)   #Кикаем паравоз
    @route.stations[@station_index].add_train(self)
    puts "Вы на станции #{@route.stations[@station_index].names}"
    else
      puts "Вы на первой станции"
    end
    
  end
end


