require 'batch'

describe Batch do
  let(:batch_123) {described_class.new(123)}

  describe '#initialize' do

    it 'has a batch number property' do
      expect(batch_123.batch_number).to eq 123
    end
    
  end

end
