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
      expect(menu.options[:welcome_message].delete(' ')).to eq(
        "Hello, world.
        I am the FundApps courier service bot.
        You can use me to get the cost of sending parcels.
        I'll provide you with numbered options as we go along but you can talk to me in English too.
        Whenever I give you numbered options just type in the number and press enter.
        If you want to give me instructions in English just type the instruction without quotation marks and press enter.
        If you'd like to turn me off at anytime just type and enter: 'end'.
        If you'd like to stop what I'm doing and go back at anytime just type and enter: 'back'.
        To get started please type and enter: 'start'".delete(' ')
      )
    end
  end

  describe '#get_started' do
    it 'returns the get started string' do
      expect(menu.options[:get_started]).to eq(
        "Let's get started!"
      )
    end
  end

  describe '#main_menu' do
    it 'returns the main menu' do
      expect(menu.options[:main_menu].delete(' ')).to eq(
        "Please select an option from the menu below.
        1: Add a new parcel to your current batch.
        2: Get a quote on a single item without adding it to your batch (you'll be able to add it later).
        3: View your current batch.
        4: Get the final quote for your current batch.
        5: Start a new batch.
        0: Shut me down :( You will lose your progress if you do this.".delete(' ')
        )
    end
  end

  describe '#add_parcel' do
    it 'returns the add parcel string' do
      expect(menu.options[:add_parcel]).to eq(
        "Adding parcels to batches is what I love to do."
      )
    end
  end

  describe '#request_length' do
    it 'returns a string asking for the length of the parcel' do
      expect(menu.options[:request_length]).to eq(
        "Can I get the length of the parcel (in cm)? "
      )
    end
  end

  describe '#request_width' do
    it 'returns a string asking for the width of the parcel' do
      expect(menu.options[:request_width]).to eq(
        "Can I get the width of the parcel (in cm)? "
      )
    end
  end

  describe '#request_height' do
    it 'returns a string asking for the height of the parcel' do
      expect(menu.options[:request_height]).to eq(
        "Can I get the height of the parcel (in cm)? "
      )
    end
  end

  describe '#parcel_added' do
    it 'returns a string saying the parcel has been added' do
      expect(menu.options[:parcel_added]).to eq(
        "Good news! I've successfully added that parcel to your batch."
      )
    end
  end

  describe '#announce_single_quote' do
    it 'returns a string announcing a single quote' do
      expect(menu.options[:announce_single_quote]).to eq(
        "Here you go boss! This is how much it will cost for that single parcel."
      )
    end
  end

  describe '#add_quote' do
    it 'returns a string asking to add a quote' do
      expect(menu.options[:add_quote]).to eq(
        "If you're happy with that I can add the parcel to your batch. Want me to do that? ('yes' or 'no') "
      )
    end
  end

  describe '#announce_batch' do
    it 'returns a string announcing an unfinalised batch' do
      expect(menu.options[:announce_batch]).to eq(
        "Hopping to it chief! Here's your batch as it stands:"
      )
    end
  end

  describe '#prepare_quote' do
    it 'returns a string preparing a final quote' do
      expect(menu.options[:prepare_quote]).to eq(
        "Gotcha. Give me a second while I prepare that"
      )
    end
  end

  describe '#announce_final_quote' do
    it 'returns a string announcing a final quote' do
      expect(menu.options[:announce_final_quote]).to eq(
        "Took a second chief, but here's that final quote!"
      )
    end
  end

  describe '#confirm_reset' do
    it 'returns a string asking to reset the batch' do
      expect(menu.options[:confirm_reset]).to eq(
        "Starting a new batch will mean you lose your current batch. Are you sure? ('yes' or 'no') "
      )
    end
  end

  describe '#announce_reset' do
    it 'returns a string announcing a batch reset' do
      expect(menu.options[:announce_reset]).to eq(
        "Nothing like a fresh start! Your batch is empty and ready to be added to."
      )
    end
  end

  describe '#confirm_exit' do
    it 'returns a string confirming an exit' do
      expect(menu.options[:confirm_exit]).to eq(
        "Ok, leaving now will mean you lose your current batch. Are you sure? ('yes' or 'no') "
      )
    end
  end

  describe '#exit_message' do
    it 'returns a string announcing an exit' do
      expect(menu.options[:exit_message]).to eq(
        "Oh captain my captain, it's been a pleasure serving you. Until you need me again, you know where to find me... so long."
      )
    end
  end

  describe '#request_repeat' do
    it 'returns a string asking for a repeat of instruction' do
      expect(menu.options[:request_repeat]).to eq(
        "Sorry friend, I didn't catch that. Can you try again making sure the response is valid?"
      )
    end
  end

end
