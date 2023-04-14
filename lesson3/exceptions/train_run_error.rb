# frozen_string_literal: true

class TrainRunError < StandardError
  def initialize(msg = 'YO BRO!!! you can not add or remove wagons in run')
    super
  end
end
