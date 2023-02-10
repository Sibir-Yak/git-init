class TrainCargo < Train
  def docking(wagon_cargo)         #стыковка  вагона
    raise TrainRunError if @speed != 0
    if @speed == 0
      wagon_cargo.is_a?(WagonCargo)
      super
    end
  end
end