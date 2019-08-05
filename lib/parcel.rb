class Parcel

  DEFAULT_NAME, DEFAULT_LENGTH, DEFAULT_WIDTH, DEFAULT_HEIGHT = 'Unnamed Parcel', 1, 1, 1

  attr_reader :name, :length, :width, :height

  def initialize(name=DEFAULT_NAME, length=DEFAULT_LENGTH, width=DEFAULT_WIDTH, height=DEFAULT_HEIGHT)
    @name = name
    @length = length
    @width = width
    @height = height
  end

  def update(**args)
    @name = args[:name] if args[:name]
    @length = args[:length] if args[:length]
    @width = args[:width] if args[:width]
    @height = args[:height] if args[:height]
  end

end
