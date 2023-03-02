class WagonCargo < Wagon
  def initialize(load)
    @container = load
    @load = load
    validate!
    super()
  end

  def validate!
    raise WagonloadSeatsEmptyError if @container <= 0 || @container == nil
    raise TooMuchVolumeError if @load > 200
  end
# метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
  def upload(load)
    @load -= load
    raise TooMuchUploadError if load > @load
    raise WagonLoadSeatsEmptyError if @load == 0 || @load == nil
  end
# метод, который возвращает занятый объем
  def busy
    @container - @load
  end
# метод, который возвращает оставшийся (доступный) объем
  def free
    @load
  end
end