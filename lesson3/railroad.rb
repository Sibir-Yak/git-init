
class RailRoad
  attr_reader :stations, :trains, :routes

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
      user_choice = gets.chomp.to_i
      case user_choice
      when 1
        menu_creation
      when 2
        menu_action
      when 3
        menu_demonstration
      when 0
        return
      else
        puts "Не вводите жуйню пожалуйста"
      end
    break if user_choice == 0
    end
    puts "Витя покинул чат"
  end

  def seed
    @trains << TrainPass.new(123)
    @trains << TrainPass.new(124)
    @trains << TrainCargo.new(234)

    @stations << Station.new("Odessa")
    @stations << Station.new("Kharkiv")
    @stations << Station.new("Yalta")
    @stations << Station.new("Dnepr")
    @stations << Station.new("Kiyv")
    @routes << Route.new(@stations[0], @stations[1])
    @routes << Route.new(@stations[1], @stations[4])
    @routes[0].add_station(@stations[3])
  end

  private

  def menu_creation
    puts "1) Cоздать поезд"
    puts "2) Создать станцию"
    puts "3) Создать маршрут"
    user_choice = gets.chomp.to_i
    case user_choice
    when 1
      trein_create
    when 2
      station_create
    when 3
      route_create
    end
  end

  def menu_action
    puts "1) Назначить маршрут поезду"
    puts "2) Удалить станцию из маршрута"
    puts "3) Переместить поезд по маршруту"
    puts "4) Добавить вагоны к поезду"
    puts "5) Отцепить вагоны от поезда"
    puts "6) Добавить станцию в маршрут"
    user_choice = gets.chomp.to_i
    case user_choice
    when 1
      assign_train_route
    when 2
      delete_station_to_route
    when 3
      move_train_along_route
    when 4
      add_wagon_to_train
    when 5
      unhook_wagon_train
    when 6
      add_station_to_route
    end
  end

  def menu_demonstration
    puts "1) Вывести список станций"
    puts "2) Вывести список поезов на станции"
    user_choice = gets.chomp.to_i
    case user_choice
    when 1
      @stations.each do |station|
      puts station.name
      end
    when 2
      @stations.each do |station|
        station.trains.each do |train|
          puts "На станции #{station.name} находится поезд номер #{train.number}"
        end
      end
    end
  end

  def trein_create
    puts "1) Пасажирский"
    puts "2) Грузовой"
    number_train = gets.chomp.to_i
    case number_train
    when 1
      puts "Введите номер поезда"
      pass_trein_number = gets.chomp.to_i
      @trains << TrainPass.new(pass_trein_number)
    when 2
      puts "Введите номер поезда"
      cargo_trein_number = gets.chomp.to_i
      @trains << TrainCargo.new(cargo_trein_number)
    end
  end

  def station_create
    puts "Введите названи станции"
    name_station = gets.chomp
    @stations << Station.new(name_station)
  end

  def route_create
    puts "Вот список доступніх станций"
    station_visualize
    puts "Введите номер начальной станции"
    station1 = gets.chomp.to_i

    puts "Введите номер последней станции"
    station2 = gets.chomp.to_i
    @routes << Route.new(@stations[station1-1], @stations[station2-1])
  end

# 3.1)Назаначить маршрут поезду
  def assign_train_route
    puts "Выберите поезд из списка"
      trains_free = @trains.select { |train| train.route == nil}
      number = 1
      if trains_free.empty?
        puts "Свободных поездов больше нет"
      end
      trains_free.each do |tr|
        puts "#{number}) Поезд: #{tr.number} свободный"
        number += 1
      end
      train_for = gets.chomp.to_i-1
      puts "Введите номер маршрута"
      rout_visualize
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
    rout_visualize
    # @routes.each(&:add_name_route)
    route_for_delete_station = gets.chomp.to_i-1
    puts "Какую станцию удаляем ?"
    puts "Введите номер"
    number = 1
    @routes[route_for_delete_station].stations.each do |station|
      puts "#{number}) #{station.name}"
      number += 1
    end
    number_station_for_delete = gets.chomp.to_i-1
    @routes[route_for_delete_station].delete_station(@routes[route_for_delete_station].stations[number_station_for_delete])
  end

# 3.3) Переместить поезд по маршруту
  def move_train_along_route
    puts "Выберете поезд из списка"
    train_busy = []
    number = 1
    @trains.each do |train|
      if train.route != nil
        puts "#{number}) Поезд с маршрутом #{train.number}"
        train_busy << train
        number += 1
      end
    end
    if train_busy.empty?
      puts "Поездов с маршрутом нет"
    end
    train_to_go = gets.chomp.to_i - 1
    if train_to_go < 0
      puts "Вы кажись что-то юлите"
      puts "Марш в первое меню"
      return
    end
    puts "Перемещаем вперед или назад? "
    puts "1) Вперед"
    puts "2) Назад"
    direction = gets.chomp.to_i
    case direction
    when 1
      train_busy[train_to_go].go_next_station
    when 2
      train_busy[train_to_go].go_previous_station
    else
      puts "Опять за старое?"
      puts "Гоу в первое меню"
    end
  end

# 3.4) Добавить вагоны к поезду
  def add_wagon_to_train
    puts "Выберете поезд к какому добавляем вагон"
    train_visualize
    train_add_wagon = gets.chomp.to_i - 1
    puts "Какой вагон добавляем ?"
    puts "1) Пасажирский"
    puts "2) Грузовой"
    wagon_for_train = gets.chomp.to_i
    case wagon_for_train
    when 1
      @trains[train_add_wagon].docking(WagonPass.new)
    when 2
      @trains[train_add_wagon].docking(WagonCargo.new)
    end
  end

# 3.5) Отцепить вагоны от поезда
  def unhook_wagon_train
    puts "Выберете поезд у которого отцепляем вагон"
    train_visualize
    train_delete_wagon = gets.chomp.to_i-1
    @trains[train_delete_wagon].undocking
  end
# 3.6 Добавить станцию из маршрута
  def add_station_to_route
    puts "В какой маршрут хотите добавить станцию?"
    puts "Введите номер"
    rout_visualize
    # @routes.each(&:add_name_route)
    # @routes.each do |route|
    #   route.add_name_route
    # end
    add_station_route = gets.chomp.to_i-1
    if add_station_route + 1 > @routes.size
      puts "Такого маршрута нема"
    else
      puts "Какую станцию добавляем ?"
      puts "Введите номер"
      station_visualize
      intermediate_station = gets.chomp.to_i-1
      if @routes[add_station_route].stations.include?(@stations[intermediate_station])
        puts "Станция уже в маршруте"
      else
        @routes[add_station_route].add_station(@stations[intermediate_station])
        puts "Добавили"
      end
    end
  end

  def train_visualize
    number = 1
    @trains.each do |train|
      if train.is_a?(TrainPass)
      puts "#{number}) Чмеха пасажирська -> #{train.number} <- вагонов: #{train.wagons.size}"
      number += 1
      elsif train.is_a?(TrainCargo)
        puts "#{number}) Чмеха грузова -> #{train.number} <-<- вагонов: #{train.wagons.size}"
      number += 1
      end
    end
  end

  def rout_visualize
    number = 1
    # @routes.each(&:add_name_route)
    @routes.each do |rout|
      name_route = ""
      rout.stations.each do |station|
        name_route += "->" + station.name
      end
      puts "#{number})  #{name_route}"
      number += 1
    end
  end

  def station_visualize
    # number = 1
    # @stations.each do |station|
    #   puts "#{number}) -> #{station.names} <-"
    #   number += 1
    # end
    @stations.each.with_index(1) do |station, index|
      puts "#{index}) -> #{station.name} <-"
    end

  end

end