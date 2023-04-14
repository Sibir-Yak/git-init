# frozen_string_literal: true

class WagonCargo < Wagon
  def initialize(loads)
    super
    @container = loads
    @load = 0
    validate!
    @container = loads.to_i
  end

  def validate!
    raise WagonLoadSeatsEmptyError if @container.to_i.to_s != @container
    raise TooMuchVolumeError if @container.to_i > 200
  end

  # метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
  def upload(loads)
    if loads.include?('.')
      raise WagonLoadSeatsEmptyError if loads.to_f.to_s != loads
    elsif loads.to_i.to_s != loads
      raise WagonLoadSeatsEmptyError
    end
    raise TooMuchUploadError if loads.to_f > free

    @load += loads.to_f
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
