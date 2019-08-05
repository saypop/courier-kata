class Batch

  attr_reader :batch_number, :parcels

  def initialize(batch_number)
    @batch_number = batch_number
    @parcels = []
  end

  def add(parcel)
    @parcels << parcel
  end

end
