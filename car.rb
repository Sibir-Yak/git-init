class Car
  # attr_writer :speed              ---  начальный атрибут сеттер ( чтобы не писать def)
  # attr_reader :speed              ---  начальный атрубут геттер ( чтобы не писать def)

  #def initialize(speed, engine_volume = 2.0) иногда мы можем установить значение переменных по умолчанию(нпример объем двжка 2.0)
  #если однина переменная задана а вторая нет то в начале в скобках мы пишем значение для не заданной переменной
  #car = Car.new(5)  ---- таким образом будет подсавленно значение 5 в переменную speed
  #написав car = Car.new(5, 1.6)   ----  мы заменим две переменные speed и engine_volume
  #def initialize                           #метод конструктор который задает начальные параметры
  def initialize(speed, engine_volume)      #конструктор с начальными атрибутами ,
  #car = Car.nev(10, 2.0)                  #которые работают как локальные переменные   
  #@speed = 10                              #начальные параметры инстанс переменной
    @speed = speed                          #начальные параметры для инстанс переменной заданные через атрибуты метода конструктор
    @engine_volume = engine_volume
    beep                                    #вызываем другой метод класса
  end

  def start_engine
    puts "Wrooom"
  end

  def beep
    puts "beep beep"
  end

  def stop
    @speed = 0        
    puts "stop"
  end 

  def go
    speed = 40         #локальная переменная
    @speed = 50        #инстанс переменная  
  end

  def current_speed         #Геттер - возвращает значение
    @speed   
  end         

  def engine_volume         #Геттер - возвращает значение
    @engine_volume          #сюда записывается инстанс переменная 
  end                       #чтобы в дальнейшем к ней обратиться 

  def set_speed(speed)      #для созданного объекта пишем car.current_speed(20)
    @speed = speed          #Сеттер - устанавливает значение
  end                       #Геттер и Сеттер можно заменить начальным атрибутом attr_speed
end