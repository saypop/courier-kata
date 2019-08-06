require 'weigher'

describe Weigher do
  let(:weigher) {described_class.new()}

  describe '#initialize' do
    it 'contains an hash with key (size) value (max weight) pairs' do
      expect(weigher.weight_limits).to be_a(Hash)
    end
  end

end
