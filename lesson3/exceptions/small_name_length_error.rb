class SmallNameLenghtError < StandardError
  def initialize(msg = "YO BRO!!! station name less than 2 characters")
    super
  end
end