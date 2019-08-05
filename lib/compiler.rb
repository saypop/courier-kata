require_relative 'sizer'
require_relative 'calculator'

class Compiler

  attr_reader :sizer, :calculator

  def initialize(sizer = Sizer.new, calculator = Calculator.new)
    @sizer = sizer
    @calculator = calculator
  end

  def header
    "
    | NAME          | TYPE          | COST           |
    |------------------------------------------------|
    "
  end

  def parcel_output(parcel)
    "
    | #{parcel.name}| #{sizer.categorise(parcel)}| $#{format('%.2f', calculator.parcel_cost(parcel))}|
    |------------------------------------------------|
    "
  end

  def fix_width(input)
    input.length <= 13? ((13 - input.length).times { input << " " }) : (input = input[0...13])
    return input + " "
  end

end
