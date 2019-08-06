require 'controller'

describe Controller do
  let(:controller) {described_class.new()}

  describe '#initialize' do
    it 'has an of a calculator from the Calculator class' do
      expect(controller.calculator).to be_an_instance_of(Calculator)
    end

    it 'has an of a compiler from the Compiler class' do
      expect(controller.compiler).to be_an_instance_of(Compiler)
    end

    it 'has an of a menu from the Menu class' do
      expect(controller.menu).to be_an_instance_of(Menu)
    end

    it 'has an of a printer from the Printer class' do
      expect(controller.printer).to be_an_instance_of(Printer)
    end

    it 'has an of a receiver from the Receiver class' do
      expect(controller.receiver).to be_an_instance_of(Receiver)
    end

    it 'has an of a sizer from the Sizer class' do
      expect(controller.sizer).to be_an_instance_of(Sizer)
    end

  end
end
