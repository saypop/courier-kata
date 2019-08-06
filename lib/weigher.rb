class Weigher < Sizer

  attr_reader :weight_limits

  def initialize()
    @weight_limits = {
      :XL => 10,
      :Large => 6,
      :Medium => 3,
      :Small => 1
    }
  end

  def excess_weight(parcel)

    0
  end

end
