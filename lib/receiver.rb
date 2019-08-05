class Receiver

  attr_reader :acceptable_strings, :acceptable_integers

  def initialize
    @acceptable_strings = ['exit', 'back', 'start', 'yes', 'no']
    @acceptable_integers = [1, 2, 3, 4, 5, 0]
  end

end
