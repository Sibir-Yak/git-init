class StopStandingError < StandardError
  def initialize(msg = "YO BRO!!! you stop what has already been stopped")
    super
  end
end