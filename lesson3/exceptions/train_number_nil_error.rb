# frozen_string_literal: true

class TrainNumberNilError < StandardError
  def initialize(msg = 'YO BRO!!! station can`t be nil')
    super
  end
end
