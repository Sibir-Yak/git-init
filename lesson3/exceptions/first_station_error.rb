# frozen_string_literal: true

class FirstStationError < StandardError
  def initialize(msg = 'Вы на первой станции, только вперёд')
    super
  end
end
