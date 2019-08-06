require_relative 'sizer'
require_relative 'weigher'
require_relative 'discounter'

class Calculator
  attr_reader :size_price_map, :sizer

  def initialize(
    sizer: Sizer.new, weigher: Weigher.new, discounter: Discounter.new
  )
    @size_price_map = {
      Small: 3.00,
      Medium: 8.00,
      Large: 15.00,
      XL: 25.00
    }
    @sizer = sizer
    @weigher = weigher
    @discounter = discounter
  end

  def parcel_cost(parcel)
    [weight_cost(parcel), size_cost(parcel)].min
  end

  def weight_cost(parcel)
    [0, parcel.weight - 50].max * 1 + 50
  end

  def size_cost(parcel)
    type = @sizer.categorise(parcel)
    @size_price_map[type] + (2 * @weigher.excess_weight(parcel))
  end

  def get_type(parcel)
    return @sizer.categorise(parcel) if weight_cost(parcel) > size_cost(parcel)

    :Heavy
  end

  def batch_cost(batch)
    total = 0.00
    batch.parcels.each { |parcel| total += parcel_cost(parcel) }
    total - discount(batch)
  end

  def discount(batch)
    @discounter.process_discount(batch.parcels, self)
  end
end
