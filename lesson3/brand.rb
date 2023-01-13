module BrandName
  attr_reader :brand

  def name_brand(names)
    self.brand = names
  end
  protected

  attr_writer :brand
end