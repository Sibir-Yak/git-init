class TrainWagonNilError < StandardError
  def initialize(msq = "YO BRO!!! there are no more wagons")
    super
  end
end