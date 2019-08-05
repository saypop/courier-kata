require 'menu'

describe Menu do
  let(:menu) {described_class.new()}

  describe '#initialize' do
    it 'contains a hash with labelled instructions for each step of the app' do
      expect(menu.options).to be_a(Hash)
    end

  end

end
