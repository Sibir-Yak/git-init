class NegativeSpeedError < StandardError
  def initialize(msg = "YO BRO!!! your speed is negative")
    super
  end
end