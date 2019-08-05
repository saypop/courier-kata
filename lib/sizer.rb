class Sizer

  attr_reader :size_dimensions

  def initialize()
    @size_dimensions = {
      'XL' => 1.0 / 0.0,
      'Large' => 100,
      'Medium' => 50,
      'Small' => 10
    }
  end

  def categorise(parcel)
    max_dimension = [parcel.length, parcel.width, parcel.height].max
    category = ''
    @size_dimensions.each { |k, v| category = k if v > max_dimension}
    return category
  end

end
