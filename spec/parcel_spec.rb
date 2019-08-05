require 'parcel'

describe Parcel do
  let(:brown_box) {described_class.new('Brown Box', 40, 20, 25)}

  describe '#initialize' do
    it 'has a name property' do
      expect(brown_box.name).to eq 'Brown Box'
    end
  end
end
