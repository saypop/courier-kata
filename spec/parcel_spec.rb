require 'parcel'

describe Parcel do
  let(:brown_box) { described_class.new(40, 20, 25, 4) }
  let(:unknown_box) { described_class.new }

  describe '#initialize' do
    it 'has a length property' do
      expect(brown_box.length).to eq 40
    end

    it 'has a width property' do
      expect(brown_box.width).to eq 20
    end

    it 'has a height property' do
      expect(brown_box.height).to eq 25
    end

    it 'has a weight property' do
      expect(brown_box.weight).to eq 4
    end

    it 'has default properties' do
      expect(unknown_box.length).to eq 1
      expect(unknown_box.width).to eq 1
      expect(unknown_box.height).to eq 1
      expect(unknown_box.weight).to eq 1
    end
  end

  describe '#update' do
    it 'can update the length of a parcel' do
      expect { unknown_box.update(length: 65) }.to change { unknown_box.length }.to(65)
    end

    it 'can update the width of a parcel' do
      expect { unknown_box.update(width: 47) }.to change { unknown_box.width }.to(47)
    end

    it 'can update the height of a parcel' do
      expect { unknown_box.update(height: 22) }.to change { unknown_box.height }.to(22)
    end
  end
end
