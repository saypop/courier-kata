require 'compiler'

describe Compiler do
  let(:compiler) {described_class.new()}

  describe '#initialize' do
    it 'has an of a sizer from the Sizer class' do
      expect(compiler.sizer).to be_an_instance_of(Sizer)
    end

    it 'has an of a calculator from the Sizer class' do
      expect(compiler.calculator).to be_an_instance_of(Calculator)
    end
  end

  describe '#header' do
    it 'compiles a header for the tables' do
      expect(compiler.header.delete(' ')).to eq(
        "
        | NAME          | TYPE          | COST           |
        |------------------------------------------------|
        ".delete(' ')
      )
    end
  end

  describe '#parcel_output' do
    it 'compiles the cost output of a small parcel' do
      sizer = generate_small_sizer
      parcel = generate_small_parcel
      calculator = generate_small_calculator
      compiler = described_class.new(sizer, calculator)
      expect(compiler.parcel_output(parcel).delete(' ')).to eq(
      "
      | Small Box     | Small         | $3.00          |
      |------------------------------------------------|
      ".delete(' ')
      )
    end
  end

  describe '#fix_width' do
    it 'truncates a long string to 13 characters' do
      expect(compiler.fix_width('12345678901234567890')).to eq('1234567890123 ')
    end
  end
end
