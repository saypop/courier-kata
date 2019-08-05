class Menu

  attr_reader :options

  def initialize
    @options = {
      :welcome => "Hello, world.
      I am the FundApps courier service bot.
      You can use me to get the cost of sending parcels.
      I'll provide you with numbered options as we go along but you can talk to me in English too.
      Whenever I give you numbered options just type in the number and press enter.
      If you want to give me instructions in English just type the instruction without quotation marks and press enter.
      If you'd like to turn me off at anytime just type and enter: 'end'.
      To get started please type and enter: 'start'",
      :get_started => "Let's get started!",
      :main_menu => "Please select an option from the menu below.
      1: Add a new parcel to your current batch.
      2: Get a quote on a single item without adding it to your batch (you'll be able to add it later).
      3: Get the final quote for your current batch.
      0: Shut me down :( You will lose your progress if you do this.",
      :add_parcel => "Adding parcels to batches is what I love to do."
    }
  end

  def welcome_message
    @options[:welcome]
  end

  def get_started
    @options[:get_started]
  end

  def main_menu
    @options[:main_menu]
  end

  def add_parcel
    @options[:add_parcel]
  end

end
