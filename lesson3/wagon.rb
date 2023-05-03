# frozen_string_literal: true

class Wagon
  include BrandName
  def initialize(_loads = 0); end

  def upload(_loads = 0)
    raise 'Not Implemented'
  end

  def free
    raise 'Not Implemented'
  end

  def busy
    raise 'Not Implemented'
  end
end
