class Menu

  attr_reader :options

  def initialize
    @options = {
      :welcome => "
      Hello, world.
      I am the FundApps courier service bot.
      You can use me to get the cost of sending parcels.
      I'll provide you with numbered options as we go along but you can talk to me in English too.
      Whenever I give you numbered options just type in the number and press enter.
      If you want to give me instructions in English just type the instruction without quotation marks and press enter.
      If you'd like to turn me off at anytime just type and enter: 'end'.
      To get started please type and enter: 'start'
      "
    }
  end

  def welcome_message
    @options[:welcome]
  end

end
