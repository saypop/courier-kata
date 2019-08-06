require 'weigher'

describe Weigher do
  let(:weigher) {described_class.new()}

  describe '#initialize' do
    it 'contains an hash with key (size) value (max weight) pairs' do
      expect(weigher.weight_limits).to be_a(Hash)
    end
  end

  describe '#excess_weight' do
    it 'returns 0 for a parcel that is not overweight' do
      parcel = generate_small_parcel
      expect(weigher.excess_weight(parcel)).to eq 0
    end
  end

end
