# frozen_string_literal: true

class TrainNumberFormatError < StandardError
  def initialize(msg = 'YO BRO!!! train number does not match the format')
    super
  end
end
