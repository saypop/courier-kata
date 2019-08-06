require_relative 'sizer'

class Calculator

  attr_reader :size_price_map, :sizer

  def initialize(sizer = Sizer.new)
    @size_price_map = {
      :Small => 3.00,
      :Medium => 8.00,
      :Large => 15.00,
      :XL => 25.00
    }
    @sizer = sizer
  end

  def parcel_cost(parcel)
    @size_price_map[@sizer.categorise(parcel)]
  end

  def batch_cost(batch)
    total = 0.00
    batch.parcels.each { |parcel| total += parcel_cost(parcel) }
    total
  end

end
