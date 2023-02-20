class FirstStationDestroyError < StandardError
  def initialize(msg ="Первая станция не удаляем")
    super
  end
end