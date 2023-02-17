class TrainStationNowError < StandardError
  def initialize(msg = "YO BRO!!! there is a train at the station now")
    super
  end
end