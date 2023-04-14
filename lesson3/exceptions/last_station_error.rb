# frozen_string_literal: true

class LastStationError < StandardError
  def initialize(msg = 'Вы на последней станции, только назад')
    super
  end
end
