class TrainCargo < Train
  def docking(wagon_cargo)         #стыковка  вагона
    if @speed == 0 
      if wagon_cargo.is_a?(WagonCargo)
        @wagons << wagon_cargo
        puts "Вагончик добавлен"
        puts "Теперь их #{@wagons.size}"
      else
        puts "Нужен другой тип вагона"
      end
    else 
      puts "Поезд в движении, стыковка неможлива"
    end
  end
end