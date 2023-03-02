class TooMuchVolumeError < StandardError
  def initialize(msg = "YO BRO!!! you have entered too much volume (max 200)")
    super
  end
end