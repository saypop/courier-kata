require 'receiver'

describe Receiver do
  let(:receiver) {described_class.new()}

  describe '#initialize' do
    it 'contains a list of acceptable string inputs' do
      expect(receiver.acceptable_strings).to eq ['exit', 'back', 'start', 'yes', 'no']
    end

    it 'contains a list of acceptable integer inputs' do
      expect(receiver.acceptable_integers).to eq [1, 2, 3, 4, 5, 0]
    end
  end

end
