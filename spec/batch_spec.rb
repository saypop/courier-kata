require 'batch'

describe Batch do
  let(:batch_123) {described_class.new(123)}

  describe '#initialize' do

    it 'has a batch number property' do
      expect(batch_123.batch_number).to eq 123
    end

    it 'has an empty array for storing parcels in' do
      expect(batch_123.parcels).to be_an(Array)
      expect(batch_123.parcels.length).to eq 0
    end
    
  end

end
