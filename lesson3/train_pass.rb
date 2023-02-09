class TrainPass < Train

  def docking(wagon_pass)         #стыковка  вагона
    if @speed == 0
      if wagon_pass.is_a?(WagonPass)
        super
      else
        puts "Нужен другой тип вагона"
      end
    else
      puts "Поезд в движении, стыковка неможлива"
    end
  end
end