class TrainNumberNotUniqError < StandardError
  def initialize(msq ="YO BRO!!! this number is already taken")
    super
  end
end