class Parcel

  attr_reader :name, :length, :width, :height

  def initialize(name, length, width, height)
    @name = name
    @length = length
    @width = width
    @height = height
  end

end
