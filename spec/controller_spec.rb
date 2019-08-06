require 'controller'

describe Controller do

  let(:controller) {described_class.new()}

  describe '#initialize' do

    it 'has a calculator from the Calculator class' do
      expect(controller.calculator).to be_an_instance_of(Calculator)
    end

    it 'has a compiler from the Compiler class' do
      expect(controller.compiler).to be_an_instance_of(Compiler)
    end

    it 'has a menu from the Menu class' do
      expect(controller.menu).to be_an_instance_of(Menu)
    end

    it 'has a printer from the Printer class' do
      expect(controller.printer).to be_an_instance_of(Printer)
    end

    it 'has a receiver from the Receiver class' do
      expect(controller.receiver).to be_an_instance_of(Receiver)
    end

    it 'has a validater from the Validater class' do
      expect(controller.validater).to be_an_instance_of(Validater)
    end

    it 'has a sizer from the Sizer class' do
      expect(controller.sizer).to be_an_instance_of(Sizer)
    end

    it 'has a batch_number' do
      expect(controller.batch_number).to eq(1)
    end
  end

  describe '#launch' do
    let(:calculator) {double('calculator')}
    let(:compiler) {double('compiler')}
    let(:menu) {double('menu')}
    let(:printer) {double('printer')}
    let(:receiver) {double('receiver')}
    let(:validater) {double('validater')}
    let(:sizer) {double('sizer')}
    let(:mock_controller) {described_class.new(calculator, compiler, menu, printer, validater, sizer)}

    it 'prints the welcome_message' do
      allow(menu).to receive(:options).and_return({ :welcome_message => "Test" })
      expect(printer).to receive(:print_output).with("Test").exactly(1).times
      mock_controller.launch
    end
  end
end
