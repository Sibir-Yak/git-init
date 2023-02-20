class TrainCargo < Train
  def docking(wagon_cargo)         #стыковка  вагона
    raise ObjectTypeError unless wagon_cargo.is_a?(WagonCargo)

    super
  end
end