require 'parcel'

describe Parcel do
  let(:brown_box) {described_class.new('Brown Box', 40, 20, 25)}
  let(:unknown_box) {described_class.new}

  describe '#initialize' do
    it 'has a name property' do
      expect(brown_box.name).to eq 'Brown Box'
    end

    it 'has a length property' do
      expect(brown_box.length).to eq 40
    end

    it 'has a width property' do
      expect(brown_box.width).to eq 20
    end

    it 'has a height property' do
      expect(brown_box.height).to eq 25
    end

    it 'has default properties' do
      expect(unknown_box.name).to eq 'Unnamed Parcel'
      expect(unknown_box.length).to eq 1
      expect(unknown_box.width).to eq 1
      expect(unknown_box.height).to eq 1
    end

  end
end
