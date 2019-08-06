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
      small_box = double('parcel', length: 9, width: 7, height: 5)
      expect(sizer.categorise(small_box)).to eq :Small
    end

    it 'returns a medium category for medium parcels' do
      medium_box = double('parcel', length: 40, width: 20, height: 5)
      expect(sizer.categorise(medium_box)).to eq :Medium
    end

    it 'returns a large category for large parcels' do
      large_box = double('parcel', length: 90, width: 45, height: 5)
      expect(sizer.categorise(large_box)).to eq :Large
    end

    it 'returns a XL category for XL parcels' do
      xl_box = double('parcel', length: 200, width: 145, height: 55)
      expect(sizer.categorise(xl_box)).to eq :XL
    end
  end

end
