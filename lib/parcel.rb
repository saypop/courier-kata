class Parcel
  DEFAULT_LENGTH = 1
  DEFAULT_WIDTH = 1
  DEFAULT_HEIGHT = 1
  DEFAULT_WEIGHT = 1

  attr_reader :length, :width, :height, :weight

  def initialize(
    length = DEFAULT_LENGTH, width = DEFAULT_WIDTH,
    height = DEFAULT_HEIGHT, weight = DEFAULT_WEIGHT)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def update(**args)
    @length = args[:length] if args[:length]
    @width = args[:width] if args[:width]
    @height = args[:height] if args[:height]
    @weight = args[:weight] if args[:weight]
  end
end
