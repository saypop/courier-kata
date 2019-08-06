require 'printer'

describe Printer do
  let(:printer) {described_class.new()}

  describe '#print_output' do
    it 'prints an output to the terminal' do
      expect{ printer.print_output('This is a test') }.to output('This is a test').to_stdout
    end
  end

end
