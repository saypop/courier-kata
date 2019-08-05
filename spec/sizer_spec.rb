require 'sizer'

describe Sizer do
  let(:sizer) {described_class.new()}

  describe '#initialize' do
    it 'contains an hash with key (size) value (max dimension) pairs' do
      expect(sizer.size_dimensions).to be_a(Hash)
    end
  end

  describe 'categorise' do
    it 'returns a small category for small parcels' do
      small_box = double('parcel', name: 'Small Box', length: 9, width: 7, height: 5)
      expect(sizer.categorise(small_box)).to eq 'Small'
    end

    it 'returns a medium category for medium parcels' do
      medium_box = double('parcel', name: 'Medium Box', length: 40, width: 20, height: 35)
      expect(sizer.categorise(medium_box)).to eq 'Medium'
    end
  end

end
