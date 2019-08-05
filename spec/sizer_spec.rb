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
  end
  
end
