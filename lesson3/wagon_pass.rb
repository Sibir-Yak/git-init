class WagonPass < Wagon
  # attr_reader :seats
# атрибут общего кол-ва мест (задается при создании вагона)
  def initialize(seats)
    @container = seats
    @seats = 0
    validate!
    super()
  end

  def validate!
    raise WagonLoadSeatsEmptyError if @container <= 0 || @container == nil
    raise TooMuchVolumeError if @container > 200
  end
# Метод который занимет места по 1 за раз
  def upload(_load = 0)
    raise TooMuchUploadError if  @seats >= @container
    @seats += 1
  end
# Возвращает количество занятых мест в вагоне
  def busy
    @seats
  end
# Возвращающий кол-во свободных мест в вагоне.
  def free
    @container - @seats
  end
end