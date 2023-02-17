class LastStationDestroyError < StandardError
  def initialize(msg ="Последняя станция не удаляем")
    super
  end
end