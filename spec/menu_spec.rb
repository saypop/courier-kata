require 'menu'

describe Menu do
  let(:menu) {described_class.new()}

  describe '#initialize' do
    it 'contains a hash with labelled instructions for each step of the app' do
      expect(menu.options).to be_a(Hash)
    end
  end

  describe '#welcome_message' do
    it 'returns a welcome message' do
      expect(menu.welcome_message.delete(' ')).to eq(
        "Hello, world.
        I am the FundApps courier service bot.
        You can use me to get the cost of sending parcels.
        I'll provide you with numbered options as we go along but you can talk to me in English too.
        Whenever I give you numbered options just type in the number and press enter.
        If you want to give me instructions in English just type the instruction without quotation marks and press enter.
        If you'd like to turn me off at anytime just type and enter: 'end'.
        To get started please type and enter: 'start'".delete(' ')
      )
    end
  end

end
