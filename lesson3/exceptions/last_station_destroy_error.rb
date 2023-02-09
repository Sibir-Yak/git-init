class LastStationDestroyError < StandardError
  def initialize(msq ="Последняя станция не удаляем")
    super
  end
end