require 'receiver'

describe Receiver do
  let(:receiver) {described_class.new()}

  describe '#initialize' do
    it 'contains a list of acceptable string inputs' do
      expect(receiver.acceptable_strings).to eq ['exit', 'back', 'start', 'yes', 'no']
    end
  end

end
