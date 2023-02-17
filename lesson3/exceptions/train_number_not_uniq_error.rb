class TrainNumberNotUniqError < StandardError
  def initialize(msg ="YO BRO!!! this number is already taken")
    super
  end
end