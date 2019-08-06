require 'calculator'

describe Calculator do
  let(:calculator) {described_class.new()}

  describe '#initialize' do
    it 'has a price map with prices for each size of parcel' do
      expect(calculator.size_price_map).to be_a(Hash)
      expect(calculator.size_price_map[:Small]).to eq 3.00
      expect(calculator.size_price_map[:Medium]).to eq 8.00
      expect(calculator.size_price_map[:Large]).to eq 15.00
      expect(calculator.size_price_map[:XL]).to eq 25.00
    end

    it 'has an of a sizer from the Sizer class' do
      expect(calculator.sizer).to be_an_instance_of(Sizer)
    end

  end

  describe '#parcel_cost' do

    it 'returns the right cost for a small parcel' do
      sizer = generate_small_sizer() # a sizer that always categorises parcels as small
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 3.00
    end

    it 'returns the right cost for a medium parcel' do
      sizer = generate_medium_sizer() # a sizer that always categorises parcels as medium
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 8.00
    end

    it 'returns the right cost for a large parcel' do
      sizer = generate_large_sizer() # a sizer that always categorises parcels as large
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 15.00
    end

    it 'returns the right cost for an XL parcel' do
      sizer = generate_xl_sizer() # a sizer that always categorises parcels as XL
      parcel = double('Parcel')
      new_calculator = described_class.new(sizer)
      expect(new_calculator.parcel_cost(parcel)).to eq 25.00
    end

  end

  describe '#batch_cost' do
    it 'returns the right cost for a batch of 4 small parcels' do
      small_parcel = double('Parcel')
      batch = generate_batch(small_parcel, small_parcel, small_parcel, small_parcel)
      allow(calculator).to receive(:parcel_cost).with(small_parcel).and_return(3.00)
      expect(calculator.batch_cost(batch)).to eq 12.00
    end

    it 'returns the right cost for a batch of 4 medium parcels' do
      medium_parcel = double('Parcel')
      batch = generate_batch(medium_parcel, medium_parcel, medium_parcel, medium_parcel)
      allow(calculator).to receive(:parcel_cost).with(medium_parcel).and_return(8.00)
      expect(calculator.batch_cost(batch)).to eq 32.00
    end

    it 'returns the right cost for a batch of 4 large parcels' do
      large_parcel = double('Parcel')
      batch = generate_batch(large_parcel, large_parcel, large_parcel, large_parcel)
      allow(calculator).to receive(:parcel_cost).with(large_parcel).and_return(15.00)
      expect(calculator.batch_cost(batch)).to eq 60.00
    end

    it 'returns the right cost for a batch of 4 xl parcels' do
      xl_parcel = double('Parcel')
      batch = generate_batch(xl_parcel, xl_parcel, xl_parcel, xl_parcel)
      allow(calculator).to receive(:parcel_cost).with(xl_parcel).and_return(25.00)
      expect(calculator.batch_cost(batch)).to eq 100.00
    end

    it 'returns the right cost for a batch of 4 mixed parcels' do
      small_parcel, medium_parcel = double('Parcel'), double('Parcel')
      large_parcel, xl_parcel = double('Parcel'),double('Parcel')
      batch = generate_batch(small_parcel, medium_parcel, large_parcel, xl_parcel)
      allow(calculator).to receive(:parcel_cost).with(small_parcel).and_return(3.00)
      allow(calculator).to receive(:parcel_cost).with(medium_parcel).and_return(8.00)
      allow(calculator).to receive(:parcel_cost).with(large_parcel).and_return(15.00)
      allow(calculator).to receive(:parcel_cost).with(xl_parcel).and_return(25.00)
      expect(calculator.batch_cost(batch)).to eq 51.00
    end
  end

end
