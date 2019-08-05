class Calculator

  attr_reader :size_price_map

  def initialize()
    @size_price_map = {
      'Small' => 3.00,
      'Medium' => 8.00,
      'Large' => 15.00,
      'XL' => 25.00
    }
  end

end
