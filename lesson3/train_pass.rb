# frozen_string_literal: true

class TrainPass < Train
  # стыковка  вагона
  def docking(wagon_pass)
    raise ObjectTypeError unless wagon_pass.is_a?(WagonPass)

    super
  end
end
