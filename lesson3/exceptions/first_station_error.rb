class FirstStationError < StandardError
  def initialize(msq = "Вы на первой станции, только вперёд")
    super
  end
end