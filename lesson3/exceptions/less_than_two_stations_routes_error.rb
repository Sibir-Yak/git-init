# frozen_string_literal: true

class LessThanTwoStationsError < StandardError
  def initialize(msg = 'YO BRO!!! less than 2 stations on the route')
    super
  end
end
