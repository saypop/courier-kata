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

  describe '#get_started' do
    it 'returns the get started string' do
      expect(menu.get_started).to eq(
        "Let's get started!"
      )
    end
  end

  describe '#main_menu' do
    it 'returns the main menu' do
      expect(menu.main_menu.delete(' ')).to eq(
        "Please select an option from the menu below.
        1: Add a new parcel to your current batch.
        2: Get a quote on a single item without adding it to your batch (you'll be able to add it later).
        3: Get the final quote for your current batch.
        0: Shut me down :( You will lose your progress if you do this.".delete(' ')
        )
    end
  end

  describe '#add_parcel' do
    it 'returns the add parcel string' do
      expect(menu.add_parcel).to eq(
        "Adding parcels to batches is what I love to do."
      )
    end
  end

  describe '#request_length' do
    it 'returns a string asking for the length of the parcel' do
      expect(menu.request_length).to eq(
        "Can I get the length of that parcel (in cm)? "
      )
    end
  end


end
