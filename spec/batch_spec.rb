require 'batch'

describe Batch do
  let(:batch_123) {described_class.new}

  describe '#initialize' do

    it 'has an empty array for storing parcels in' do
      expect(batch_123.parcels).to be_an(Array)
      expect(batch_123.parcels.length).to eq 0
    end

  end

  describe '#add' do

    it 'adds parcel to the parcels array' do
      blue_box = double('parcel', length: 20, width: 15, height: 10)
      expect{batch_123.add(blue_box)}.to change{batch_123.parcels}.from([]).to([blue_box])
    end

  end
end
