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

    it 'has an of a sizer from the Sizer class' do
      expect(calculator.sizer).to be_an_instance_of(Sizer)
    end

  end

  describe '#parcel_cost' do

    it 'returns the right cost for a small parcel' do
      sizer = small_sizer() # a sizer that always categorises parcels as small
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 3.00
    end

    it 'returns the right cost for a medium parcel' do
      sizer = medium_sizer() # a sizer that always categorises parcels as medium
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 8.00
    end

    it 'returns the right cost for a large parcel' do
      sizer = large_sizer() # a sizer that always categorises parcels as large
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 15.00
    end

    it 'returns the right cost for an XL parcel' do
      sizer = xl_sizer() # a sizer that always categorises parcels as XL
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 25.00
    end

  end

end
