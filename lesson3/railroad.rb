# frozen_string_literal: true

class RailRoad
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    loop do
      puts '1) Если вы хотите создать станцию, поезд, вагон или маршрут'
      puts '2) Если вы хотите произвести операцию с созданными объектами'
      puts '3) Если вы хоите вывести текущие данные о объектах'
      puts '0) Если вас всё залюбило и Вите надо выйти'
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
        puts 'Не вводите жуйню пожалуйста'
      end
      break if user_choice.zero?
    end
    puts 'Витя покинул чат'
  end

  def seed
    @trains << TrainPass.new('pas-01')
    @trains << TrainPass.new('pas-02')
    @trains << TrainCargo.new('gru-01')

    @stations << Station.new('Odessa')
    @stations << Station.new('Kharkiv')
    @stations << Station.new('Yalta')
    @stations << Station.new('Dnepr')
    @stations << Station.new('Kiyv')
    @routes << Route.new(@stations[0], @stations[1])
    @routes << Route.new(@stations[1], @stations[4])
    @routes[0].add_station(@stations[3])
    @trains[0].docking(WagonPass.new('100'))
    @trains[0].docking(WagonPass.new('120'))
    @trains[0].add_route(@routes[0])
    @trains[1].add_route(@routes[0])
    @trains[1].docking(WagonPass.new('200'))
    @trains[2].docking(WagonCargo.new('150'))
    @trains[2].add_route(@routes[0])
  end

  private

  def menu_creation
    puts '1) Cоздать поезд'
    puts '2) Создать станцию'
    puts '3) Создать маршрут'
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
    puts '1) Назначить маршрут поезду'
    puts '2) Удалить станцию из маршрута'
    puts '3) Переместить поезд по маршруту'
    puts '4) Добавить вагоны к поезду'
    puts '5) Отцепить вагоны от поезда'
    puts '6) Добавить станцию в маршрут'
    puts '7) Увееличить скорость паравозу'
    puts '8) Уменьшить скорость паравозу'
    puts '9) Остановить паровоз'
    puts '10) Занять место в вагоне'
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
    when 7
      speed_train_up
    when 8
      speed_train_down
    when 9
      train_stoped
    when 10
      upload_wagon
    end
  end

  def menu_demonstration
    puts '1) Вывести список станций'
    puts '2) Вывести список поезов на станции'
    puts '3) Узнать какой поезд двигаеться'
    puts '4) Информация о паравозах'
    puts '5) Информация по количеству свободного места в вагонах на станции'
    case gets.chomp.to_i # Можно обойтись без одноразовой переменной.
    when 1
      @stations.each do |station|
        puts station.name
      end
    when 2
      block = lambda { |a, b, c, d|
        puts
        print "Станция-> #{a}"
        print ";   Номер-> #{b}"
        print ";   Тип-> #{c}"
        print ";   Количество вагонов-> #{d}"
      }
      @stations.each do |station|
        station.number_type_quantity(&block)
      end
      puts
    when 3
      @trains.each do |train|
        if train.speed.zero?
          puts 'Все чмехи стоят'
        else
          puts "Чмеха под номером #{train.number} ураганит на скорости #{train.speed} км.ч. в пространство"
        end
      end
    when 4
      train_visualize
      puts
    when 5
      puts 'Выбирете нужную станцию'
      station_visualize
      wagon_visualize
      puts
    end
  end

  def trein_create
    puts '1) Пасажирский'
    puts '2) Грузовой'
    number_train = gets.chomp.to_i
    case number_train
    when 1
      puts 'Введите номер поезда в формате (ХХХ-ХХ)'
      pass_trein_number = gets.chomp
      @trains << TrainPass.new(pass_trein_number)
    when 2
      puts 'Введите номер поезда в формате (ХХХ-ХХ)'
      cargo_trein_number = gets.chomp
      @trains << TrainCargo.new(cargo_trein_number)
    end
  rescue StandardError => e
    puts e.message
  end

  def station_create
    puts 'Введите названи станции'
    name_station = gets.chomp
    @stations << Station.new(name_station)
  rescue StandardError => e
    puts e.message
  end

  def route_create
    puts 'Вот список доступніх станций'
    station_visualize
    puts 'Введите номер начальной станции'
    station1 = gets.chomp.to_i

    puts 'Введите номер последней станции'
    station2 = gets.chomp.to_i
    if station1 == station2
      puts 'Введены одинаковые станции'
    elsif station1.zero? || station2.zero?
      puts 'Вы не ввели номер станции'
    else
      @routes << Route.new(@stations[station1 - 1], @stations[station2 - 1])
      puts 'Маршрут добавлен:'
      @routes[-1].showing_stations
    end
  rescue StandardError => e
    puts e.message
  end

  # 3.1)Назаначить маршрут поезду
  def assign_train_route
    puts 'Выберите поезд из списка'
    trains_free = @trains.select { |train| train.route.nil? }
    number = 1
    puts 'Свободных поездов больше нет' if trains_free.empty?
    trains_free.each do |tr|
      puts "#{number}) Поезд: #{tr.number} свободный"
      number += 1
    end
    train_for = gets.chomp.to_i - 1
    puts 'Введите номер маршрута'
    rout_visualize
    rout_for = gets.chomp.to_i - 1
    if train_for.negative? || rout_for.negative?
      puts 'Вы кажись что-то юлите'
      puts 'Марш в первое меню'
      return
    end
    trains_free[train_for].add_route(@routes[rout_for])
    puts "Поезду #{trains_free[train_for].number} назнаен маршрут:"
    @routes[rout_for].showing_stations
  rescue StandardError => e
    puts e.message
  end

  # 3.2) Удалить станцию из маршрута
  def delete_station_to_route
    puts 'Из какого маршрута хотите удалить станцию?'
    puts 'Введите номер'
    rout_visualize
    # @routes.each(&:showing_stations)
    route_for_delete_station = gets.chomp.to_i - 1
    puts 'Какую станцию удаляем ?'
    puts 'Введите номер'
    number = 1
    @routes[route_for_delete_station].stations.each do |station|
      puts "#{number}) #{station.name}"
      number += 1
    end
    number_station_for_delete = gets.chomp.to_i - 1
    station_for_delete = @routes[route_for_delete_station].stations[number_station_for_delete]
    puts "Вы выбрали станцию #{station_for_delete.name}"
    @routes[route_for_delete_station].delete_station(station_for_delete)
    puts 'Удалили из маршрута'
    puts "Теперь: #{@routes[route_for_delete_station].showing_stations}"
  rescue StandardError => e
    puts e.message
  end

  # 3.3) Переместить поезд по маршруту
  def move_train_along_route
    puts 'Выберете поезд из списка'
    train_busy = []
    number = 1
    @trains.each do |train|
      next if train.route.nil?

      puts "#{number}) Поезд с маршрутом #{train.number}"
      train_busy << train
      number += 1
    end
    if train_busy.empty?
      puts 'Поездов с маршрутом нет'
      return
    end
    train_to_go = gets.chomp.to_i - 1
    if train_to_go.negative?
      puts 'Вы кажись что-то юлите'
      puts 'Марш в первое меню'
      return
    end
    puts 'Перемещаем вперед или назад? '
    puts '1) Вперед'
    puts '2) Назад'
    # direction = gets.chomp.to_i
    case gets.chomp.to_i
    when 1
      train_busy[train_to_go].go_next_station
      puts 'Вы на станции:'
      puts train_busy[train_to_go].current_station.name
    when 2
      train_busy[train_to_go].go_previous_station
      puts 'Вы на станции:'
      puts train_busy[train_to_go].current_station.name
    else
      puts 'Опять за старое?'
      puts 'Гоу в первое меню'
    end
  rescue StandardError => e
    puts e.message
  end

  # 3.4) Добавить вагоны к поезду
  def add_wagon_to_train
    puts 'Выберете поезд к какому добавляем вагон'
    train_visualize
    train_add_wagon = gets.chomp.to_i - 1
    selected_train = @trains[train_add_wagon]
    case selected_train
    when TrainPass
      puts 'Выбран пасажирский вагон'
      puts 'Сколько мест будет в вагоне?'
      puts '(Максимум 200)'
      seats = gets.chomp
      selected_train.docking(WagonPass.new(seats))
    when TrainCargo
      puts 'Выбран грузовой вагон'
      puts 'Сколько груза будет помещаться в вагон?'
      puts '(Максимум 200)'
      loads = gets.chomp
      selected_train.docking(WagonCargo.new(loads))
    else
      puts 'Вы выбрали чепуху'
    end
    puts 'Вагончик добавлен'
    puts "Теперь их #{selected_train.wagons.size}"
  rescue StandardError => e
    puts e.message
  end

  # 3.5) Отцепить вагоны от поезда
  def unhook_wagon_train
    puts 'Выберете поезд у которого отцепляем вагон'
    train_visualize
    train_delete_wagon = gets.chomp.to_i - 1
    @trains[train_delete_wagon].undocking
  rescue StandardError => e
    puts e.message
  end

  # 3.6 Добавить станцию в маршрута
  def add_station_to_route
    puts 'В какой маршрут хотите добавить станцию?'
    puts 'Введите номер'
    rout_visualize
    # @routes.each(&:showing_stations)
    # @routes.each do |route|
    #   route.showing_stations
    # end
    add_station_route = gets.chomp.to_i - 1
    if add_station_route + 1 > @routes.size
      puts 'Такого маршрута нема'
    else
      puts 'Какую станцию добавляем ?'
      puts 'Введите номер'
      station_visualize
      intermediate_station = gets.chomp.to_i - 1
      if @routes[add_station_route].stations.include?(@stations[intermediate_station])
        puts 'Станция уже в маршруте'
      else
        @routes[add_station_route].add_station(@stations[intermediate_station])
        puts 'Добавили'
      end
    end
  rescue StandardError => e
    puts e.message
  end

  # 3.7 Увеличиваем скорость паровозу
  def speed_train_up
    puts 'Какую чмеху разгоняем?'
    train_visualize
    train_speed_up = gets.chomp.to_i - 1
    puts 'На какую скорость? (в разумных пределах)'
    speed_for_train = gets.chomp.to_i
    @trains[train_speed_up].speed_up(speed_for_train)
    print "Запускаем чмеху #{@trains[train_speed_up].number} "
    puts "на орбиту со скоростью #{@trains[train_speed_up].speed} км.ч."
  rescue StandardError => e
    puts e.message
  end

  # 3.8 Уменьшаем скорость паровозу
  def speed_train_down
    puts 'Какую чмеху тормозим?'
    train_visualize
    train_speed_down = gets.chomp.to_i - 1
    puts 'На какую скорость тормозим?'
    puts '(если меньше текущей то приведет к остановке)'
    speed_for_train = gets.chomp.to_i
    @trains[train_speed_down].speed_down(speed_for_train)
    puts "Скорость чмехи #{@trains[train_speed_down].number} упала дo #{@trains[train_speed_down].speed} км.ч."
  rescue StandardError => e
    puts e.message
  end

  # 3.9 Останавливаем чухню
  def train_stoped
    puts 'Какую чухню стопаем?'
    train_visualize
    train_speed_stop = gets.chomp.to_i - 1
    @trains[train_speed_stop].stop
    puts "Чухня #{@trains[train_speed_stop].number} стопнута"
  rescue StandardError => e
    puts e.message
  end

  # 3.10 Загрузить вагон
  def upload_wagon
    trains = []
    puts 'Выберите поезд для загрузки'
    @trains.each.with_index(1) do |train, index|
      if train.wagons.any?
        puts "#{index}) -> #{train.number} <-"
        trains << train
      end
    end
    user_choice_train = gets.chomp.to_i - 1
    puts 'Выберете вагон'
    block(trains[user_choice_train])
    user_choice_wagon = gets.chomp.to_i - 1
    wagon = trains[user_choice_train].wagons[user_choice_wagon]
    if wagon.is_a?(WagonCargo)
      puts "Сколько тон грузим? Осталось места #{wagon.free}"
      user_choice_load = gets.chomp
      wagon.upload(user_choice_load)
      puts "Добавляем #{user_choice_load} тонн груза"
    else
      wagon.upload
      puts 'Добавляем одного пассажира'
      puts "Осталось места #{wagon.free}"
    end
  rescue StandardError => e
    puts e.message
  end

  def train_visualize
    number = 1
    @trains.each do |train|
      case train
      when TrainPass
        puts "#{number}) Чмеха пасажирська -> #{train.number} <- вагонов: #{train.wagons.size} скорость: #{train.speed}"
        number += 1
      when TrainCargo
        puts "#{number}) Чмеха грузова -> #{train.number} <- вагонов: #{train.wagons.size} скорость: #{train.speed}"
        number += 1
      end
    end
  end

  def rout_visualize
    number = 1
    # @routes.each(&:showing_stations)
    @routes.each do |rout|
      name_route = ''
      rout.stations.each do |station|
        name_route += "->#{station.name}"
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

  def wagon_visualize
    user_choice = gets.chomp.to_i - 1
    # block = proc { |number, type_wagon, free_volume, busy_volume|
    #   puts
    #   print "Номер вагона-> " + number.to_s
    #   print ";   Тип вагона-> " + type_wagon
    #   print ";   Количество свободного места-> " + free_volume.to_s
    #   puts ";   Количество занятого места-> " + busy_volume.to_s
    # }
    @stations[user_choice].trains.each do |train|
      puts
      # # train.block
      puts train.number
      # train.list_wagons_trains(train, &block)
      block(train)
    end
  end

  def block(train)
    block = proc { |number, type_wagon, free_volume, busy_volume|
      # puts
      print "Номер вагона-> #{number}"
      print ";   Тип вагона-> #{type_wagon}"
      print ";   Количество свободного места-> #{free_volume}"
      puts ";   Количество занятого места-> #{busy_volume}"
    }
    train.list_wagons_trains(&block)
  end
end
