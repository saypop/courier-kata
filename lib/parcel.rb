class Parcel

  DEFAULT_LENGTH, DEFAULT_WIDTH, DEFAULT_HEIGHT =  1, 1, 1

  attr_reader :length, :width, :height

  def initialize(length=DEFAULT_LENGTH, width=DEFAULT_WIDTH, height=DEFAULT_HEIGHT)
    @length = length
    @width = width
    @height = height
  end

  def update(**args)
    @length = args[:length] if args[:length]
    @width = args[:width] if args[:width]
    @height = args[:height] if args[:height]
  end

end
