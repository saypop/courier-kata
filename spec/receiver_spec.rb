require 'receiver'

describe Receiver do

  let(:receiver) {described_class.new()}

  describe '#get_input' do
    it 'gets an input from the user' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('start')
      expect(receiver.get_input).to eq 'start'
    end
  end

end
