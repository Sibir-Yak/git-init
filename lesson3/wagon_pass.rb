# frozen_string_literal: true

class WagonPass < Wagon
  def initialize(seats)
    super
    @container = seats
    @seats = 0
    validate!
    @container = seats.to_i
  end

  def validate!
    raise WagonLoadSeatsEmptyError if @container.to_i.to_s != @container
    raise TooMuchVolumeError if @container.to_i > 200
  end

  # Метод который занимет места по 1 за раз
  def upload(_loads = 0)
    raise TooMuchUploadError if @seats >= free

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
