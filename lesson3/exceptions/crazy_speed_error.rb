# frozen_string_literal: true

class CrazySpeedError < StandardError
  def initialize(msg = 'YO BRO!!! your speed is crazy')
    super
  end
end
