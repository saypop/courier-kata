require 'calculator'

describe Calculator do
  let(:calculator) {described_class.new()}

  describe '#initialize' do
    it 'has a price map with prices for each size of parcel' do
      expect(calculator.size_price_map).to be_a(Hash)
      expect(calculator.size_price_map['Small']).to eq 3.00
      expect(calculator.size_price_map['Medium']).to eq 8.00
      expect(calculator.size_price_map['Large']).to eq 15.00
      expect(calculator.size_price_map['XL']).to eq 25.00
    end
  end


end
