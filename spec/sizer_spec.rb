require 'sizer'

describe Sizer do
  let(:sizer) {described_class.new()}

  describe '#initialize' do
    it 'contains an hash with key (size) value (max dimension) pairs' do
      expect(sizer.size_dimensions).to be_a(Hash)
    end
  end

end
