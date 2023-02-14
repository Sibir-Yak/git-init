class TrainPass < Train
  def docking(wagon_pass)         #стыковка  вагона
    raise ObjectTypeError unless wagon_pass.is_a?(WagonPass)

    super
  end
end