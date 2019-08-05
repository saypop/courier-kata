class Parcel

  attr_reader :name, :length, :width

  def initialize(name, length, width, height)
    @name = name
    @length = length
    @width = width
  end

end
