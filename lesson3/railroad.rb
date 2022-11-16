
class RailRoad
  attr_reader :stations
  attr_reader :trains
  attr_reader :routes
  attr_reader :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    
  end

  def menu 
    loop do
    puts "1) Если вы хотите создать станцию, поезд, вагон или маршрут"
    puts "2) Если вы хотите произвести операцию с созданными объектами"
    puts "3) Если вы хоите вывести текущие данные о объектах"
    puts "0) Если вас всё залюбило и Вите надо выйти"
    number = gets.chomp.to_i
      if number == 1
        menu2
      elsif number == 2
        menu3
      elsif number == 3
        menu4
      elsif number == 0 #чтобы выйти и не попасться на речь бранную
        return
      else
        puts "Не вводите жуйню пожалуйста"
      end


    break if number == 0
    
    end
    puts "Витя покинул чат"
  end

  def menu2
    puts "1) Cоздать поезд"
    puts "2) Cоздать вагон"
    puts "3) Создать станцию"
    puts "4) Создать маршрут"
    num2 = gets.chomp.to_i
    if num2 == 1
      trein_create
    elsif num2 == 2
      wagon_create
    elsif num2 == 3
      station_create
    elsif num2 == 4
      route_create
    end
  end

  def menu3
    puts "1) Назначить маршрут поезду"
    puts "2) Удалить станцию из маршрута"
    puts "3) Переместить поезд по маршруту"
    puts "4) Добавить вагоны к поезду"
    puts "5) Отцепить вагоны от поезда"
    puts "6) Добавить станцию в маршрут"
    num3 = gets.chomp.to_i
    if num3 == 1
      assign_train_route
    elsif num3 == 2
      delete_station_to_route
    elsif num3 == 3
      move_train_along_route
    elsif num3 == 4
      add_wagon_to_train
    elsif num3 == 5
      unhook_wagon_train
    elsif num3 == 6
      add_station_to_route    
    end
  end

  def menu4
    puts "1) Вывести список станций"
    puts "2) Вывести список поезов на станции"
    num4 = gets.chomp.to_i
    if num4 == 1 
      @stations.each do |station| 
        puts station.names
      end
    elsif num4 == 2
      @stations.each do |station| 
        station_for_train = station.names       
        station.trains.each do |train|
          train_for_station = train.number
          puts "На станции #{station_for_train} находится поезд номер #{train_for_station}" 
        end     
      end
    end
  end

  def trein_create
    puts "1) Пасажирский"
    puts "2) Грузовой"
    num = gets.chomp.to_i
    if num == 1
      puts "Введите номер поезда"
      pass_trein_number = gets.chomp.to_i
      @trains << TrainPass.new(pass_trein_number, "pass")    
    elsif num == 2
      puts "Введите номер поезда"
      cargo_trein_number = gets.chomp.to_i
      @trains << TrainCargo.new(cargo_trein_number, "cargo")     
    end
  end

  def wagon_create
    puts "1) Пасажирский"
    puts "2) Грузовой"
    num = gets.chomp.to_i
    if num == 1
      @wagons << WagonPass.new
    elsif num == 2
      @wagons << WagonCargo.new
    end
  end

  def station_create
    puts "Введите названи станции"
    name_station = gets.chomp
    @stations << Station.new(name_station)
  end

  def route_create   
    puts "Вот список доступніх станций"
    @stations.each { |station| puts station.names }
    puts "Введите номер начальной станции"
    station1 = gets.chomp.to_i

    puts "Введите номер последней станции"
    station2 = gets.chomp.to_i
    @routes << Route.new(@stations[station1-1], @stations[station2-1])
  end

# 3.1)Назаначить маршрут поезду
  def assign_train_route 
    puts "Выберите поезд из списка"
      trains_free = []     
      @trains.each do |train|       
        train_number = train.number
        if train.route == nil 
          puts "Поезд: #{train_number} свободный"
          trains_free << train
        end
      end  
      if trains_free.empty?
        puts "Свободных поездов больше нет"
      end
      train_for = gets.chomp.to_i-1
      puts "Введите номер маршрута"
      @routes.each(&:add_name_route)
      rout_for = gets.chomp.to_i-1
      if train_for < 0 || rout_for < 0
        puts "Вы кажись что-то юлите"
        puts "Марш в первое меню"
        return
      end
      trains_free[train_for].add_route(@routes[rout_for])
      puts "Поезду #{trains_free[train_for].number} назнаен маршрут:"  
      @routes[rout_for].add_name_route
  end

# 3.2) Удалить станцию из маршрута
  def delete_station_to_route
    puts "Из какого маршрута хотите удалить станцию?"
    puts "Введите номер"
    @routes.each(&:add_name_route)
    route_for_delete_station = gets.chomp.to_i-1
    puts "Какую станцию удаляем ?"
    puts "Введите номер"
    @routes[route_for_delete_station].stations.each { |station| puts station.names }
    number_station_for_delete = gets.chomp.to_i-1
    @routes[route_for_delete_station].delete_station(@routes[route_for_delete_station].stations[number_station_for_delete])
  end

# 3.3) Переместить поезд по маршруту 
  def move_train_along_route
    puts "Выберете поезд из списка"
    train_busy = []
    @trains.each do |train|        
      if train.route != nil
        puts "Поезд с маршрутом #{train.number}"
        train_busy << train
      end
    end
    if train_busy.empty?
      puts "Поездов с маршрутом нет"
    end
    train_to_go = gets.chomp.to_i-1
    if train_to_go < 0 
      puts "Вы кажись что-то юлите"
      puts "Марш в первое меню"
      return
    end
    puts "Перемещаем вперед или назад? "
    puts "1) Вперед"
    puts "2) Назад"
    direction = gets.chomp.to_i
    if direction == 1
      train_busy[train_to_go].go_next_station
    elsif direction == 2 
      train_busy[train_to_go].go_previous_station
    else
      puts "Опять за старое?"
      puts "Гоу в первое меню"
    end
  end
  
# 3.4) Добавить вагоны к поезду
  def add_wagon_to_train
    puts "Выберете поезд к какому добавляем вагон"
    @trains.each { |train| puts train.number }
    train_add_wagon = gets.chomp.to_i-1
    if @trains[train_add_wagon].type == "pass"
      puts "Вы выбрали пассажирский поезд"
      puts "Добавляем один пассажирский вагон"
      @trains[train_add_wagon].docking(WagonPass.new)
    elsif @trains[train_add_wagon].type == "cargo"
      puts "Вы выбрали грузовой поезд"
      puts "Добавляем один грузовой вагон"
      @trains[train_add_wagon].docking(WagonCargo.new)
    else
      puts "Фигня какая-то"
    end
  end

# 3.5) Отцепить вагоны от поезда
  def unhook_wagon_train
    puts "Выберете поезд у которого отцепляем вагон"
    @trains.each { |train| puts train.number }
    train_delete_wagon = gets.chomp.to_i-1
    @trains[train_delete_wagon].undocking
  end
# 3.6 Удалить станцию из маршрута
  def add_station_to_route
    puts "В какой маршрут хотите добавить станцию?"
    puts "Введите номер"
    @routes.each(&:add_name_route)
    # @routes.each do |route|
    #   route.add_name_route 
    # end
    add_station_route = gets.chomp.to_i-1
    if add_station_route + 1 > @routes.size
      puts "Такого маршрута нема"
    else
      puts "Какую станцию добавляем ?"
      puts "Введите номер"
      @stations.each { |station| puts station.names }
      intermediate_station = gets.chomp.to_i-1
      if @routes[add_station_route].stations.include?(@stations[intermediate_station])
        puts "Станция уже в маршруте" 
      else
        puts "Добавили" 
        @routes[add_station_route].add_station(@stations[intermediate_station])
      end 
    end
  end

  def seed
    @trains << TrainPass.new(123, "pass")      
    @trains << TrainPass.new(124, "pass")
    @trains << TrainCargo.new(234, "cargo")

    @stations << Station.new("Odessa")
    @stations << Station.new("Kharkiv")
    @stations << Station.new("Yalta")
    @stations << Station.new("Dnepr")
    @stations << Station.new("Kiyv")
    @routes << Route.new(@stations[0], @stations[1])
    @routes << Route.new(@stations[1], @stations[4])
    @routes[0].add_station(@stations[3])
  end
end