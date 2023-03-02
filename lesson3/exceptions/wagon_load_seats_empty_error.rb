class WagonLoadSeatsEmptyError < StandardError
  def initialize(msg = 'YO BRO!!! you entered a null or empty value')
    super
  end
end