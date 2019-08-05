require_relative 'sizer'
require_relative 'calculator'

class Compiler

  attr_reader :sizer, :calculator

  def initialize(sizer = Sizer.new, calculator = Calculator.new)
    @sizer = sizer
    @calculator = calculator
  end

end
