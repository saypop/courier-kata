class Batch

  attr_reader :parcels

  def initialize
    @parcels = []
  end

  def add(parcel)
    @parcels << parcel
  end

end
