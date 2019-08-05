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

end
