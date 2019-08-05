class Receiver

  attr_reader :acceptable_strings

  def initialize
    @acceptable_strings = ['exit', 'back', 'start', 'yes', 'no']
  end

end
