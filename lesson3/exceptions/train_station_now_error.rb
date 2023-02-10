class TrainStationNowError < StandardError
  def initialize(msq = "YO BRO!!! there is a train at the station now")
    super
  end
end