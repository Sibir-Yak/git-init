# frozen_string_literal: true

class StationNameError < StandardError
  def initialize(msg = 'YO BRO!!! only numbers in the title or empty')
    super
  end
end
