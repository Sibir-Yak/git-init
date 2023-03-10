class WagonCargo < Wagon
  def initialize(load)
    @container = load
    @load = 0
    validate!
    super()
  end

  def validate!
    raise WagonloadSeatsEmptyError if @container <= 0 || @container == nil
    raise TooMuchVolumeError if @container> 200
  end
# метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
  def upload(load)
    raise TooMuchUploadError if load > @container - @load
    raise WagonLoadSeatsEmptyError if load == 0 || load == nil
    @load += load
  end
# метод, который возвращает занятый объем
  def busy
    @load
  end
# метод, который возвращает оставшийся (доступный) объем
  def free
    @container - @load
  end
end