class Parcel

  attr_reader :name, :length

  def initialize(name, length, width, height)
    @name = name
    @length = length
  end

end
