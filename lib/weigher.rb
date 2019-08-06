class Weigher < Sizer

  attr_reader :weight_limits

  def initialize()
    super
    @weight_limits = {
      :XL => 10,
      :Large => 6,
      :Medium => 3,
      :Small => 1
    }
  end

  def excess_weight(parcel)
    excess = [0, (parcel.weight - @weight_limits[categorise(parcel)]).ceil.to_int].max
    return excess
  end

end
