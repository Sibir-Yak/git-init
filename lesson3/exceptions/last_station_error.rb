class LastStationError < StandardError
  def initialize(msq ="Вы на последней станции, только назад")
    super
  end
end