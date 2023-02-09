class FirstStationDestroyError < StandardError
  def initialize(msq ="Первая станция не удаляем")
    super
  end
end