class TrainRunError < StandardError
  def initialize(msq = "YO BRO!!! you can not add or remove wagons in run")
    super
  end
end