require 'discounter'

describe Discounter do
  let(:discounter) {described_class.new()}

  describe '#create_discount_object' do
    it 'changes the discount object' do
      batch_object = generate_batch_object
      calculator = Calculator.new
      expect{ discounter.create_discount_object(batch_object, calculator)
      }.to change{ discounter.discount_object }.from(
        { :Small => [], :Medium => [], :Other => []}
      ).to(
        {
        :Small=>[3.0, 3.0, 3.0, 3.0, 3.0],
        :Medium=>[12.0, 12.0, 12.0, 12.0, 12.0, 12.0, 12.0],
        :Other=>[15.0, 15.0, 15.0, 15.0, 15.0, 51, 51]
      }
      )
    end
  end
end
