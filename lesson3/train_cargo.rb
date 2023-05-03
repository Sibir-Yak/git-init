# frozen_string_literal: true

class TrainCargo < Train
  # стыковка  вагона
  def docking(wagon_cargo)
    raise ObjectTypeError unless wagon_cargo.is_a?(WagonCargo)

    super
  end
end
