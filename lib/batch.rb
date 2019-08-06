class Batch

  attr_reader :parcels, :discounter

  def initialize
    @parcels = []
  end

  def add(parcel)
    @parcels << parcel
  end

end
