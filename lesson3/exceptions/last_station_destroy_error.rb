# frozen_string_literal: true

class LastStationDestroyError < StandardError
  def initialize(msg = 'Последняя станция не удаляем')
    super
  end
end
