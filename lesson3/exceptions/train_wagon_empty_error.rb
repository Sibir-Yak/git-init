class TrainWagonEmptyError < StandardError
  def initialize(msg = "YO BRO!!! there are no more wagons")
    super
  end
end