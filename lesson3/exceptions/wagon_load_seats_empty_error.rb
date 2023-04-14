# frozen_string_literal: true

class WagonLoadSeatsEmptyError < StandardError
  def initialize(msg = 'YO BRO!!! you entered a null,empty or bullshit value')
    super
  end
end
