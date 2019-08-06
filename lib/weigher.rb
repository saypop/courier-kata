class Weigher

  attr_reader :weight_limits

  def initialize()
    @weight_limits = {
      :XL => 10,
      :Large => 6,
      :Medium => 3,
      :Small => 1
    }
  end


end
