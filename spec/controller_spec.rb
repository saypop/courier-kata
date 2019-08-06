require 'controller'

describe Controller do

  let(:controller) {described_class.new()}

  describe '#initialize' do

    it 'has a batch from the Batch class' do
      expect(controller.batch).to be_an_instance_of(Batch)
    end

    it 'has a calculator from the Calculator class' do
      expect(controller.calculator).to be_an_instance_of(Calculator)
    end

    it 'has a compiler from the Compiler class' do
      expect(controller.compiler).to be_an_instance_of(Compiler)
    end

    it 'has a sizer from the Sizer class' do
      expect(controller.sizer).to be_an_instance_of(Sizer)
    end

  end

  describe '#new_parcel' do

    it 'creates a new parcel' do
      parcel = double('parcel', :length => 50, :width => 40, :height => 25)
      parcel_class = double('Parcel', :new => parcel)
      expect{ controller.new_parcel(50, 40, 25, parcel_class) }.to change{
      controller.batch.parcels }.from([]).to([parcel])
    end

    it 'prints a quote' do
      allow(STDOUT).to receive(:puts)
      controller.get_quote
      expect(STDOUT).to have_received(:puts).exactly(1).times
    end
  end

end
