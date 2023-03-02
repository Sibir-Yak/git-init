class WagonPass < Wagon
  # attr_reader :seats
# атрибут общего кол-ва мест (задается при создании вагона)
  def initialize(seats)
    @container = seats
    @seats = seats
    validate!
    super()
  end

  def validate!
    raise WagonLoadSeatsEmptyError if @container <= 0 || @container == nil
    raise TooMuchVolumeError if @container > 200
  end
# Метод который занимет места по 1 за раз
  def upload#(_load)
    @seats -= 1
    raise TooMuchUploadError if 0 >= @seats
  end
# Возвращает количество занятых мест в вагоне
  def busy
    @container - @seats
  end
# Возвращающий кол-во свободных мест в вагоне.
  def free
    @seats
  end
end