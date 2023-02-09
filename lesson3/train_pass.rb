class TrainPass < Train
  def docking(wagon_pass)         #стыковка  вагона
    if @speed == 0
      wagon_pass.is_a?(WagonPass)
      super
    end
  end
end