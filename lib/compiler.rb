require_relative 'sizer'
require_relative 'calculator'

class Compiler

  attr_reader :sizer, :calculator

  def initialize(sizer = Sizer.new, calculator = Calculator.new(sizer))
    @sizer = sizer
    @calculator = calculator
  end

  def header
    "
    | TYPE          | COST            |
    |---------------------------------|
    "
  end

  def parcel_output(parcel)
    "| #{fix_width(sizer.categorise(parcel))}| $#{fix_width(format('%.2f', calculator.parcel_cost(parcel)))} |
    |---------------------------------|
    " if parcel
  end

  def batch_output(batch)
    string = ""
    batch.parcels.each { |parcel| string << parcel_output(parcel) } if batch
    return string
  end

  def speedy_output(batch)
    "| Speedy        | $#{fix_width(format('%.2f', calculator.batch_cost(batch)))} |
    |---------------------------------|
    "
  end

  def footer(batch, speedy = false)
    total = calculator.batch_cost(batch)
    speedy ?  total = total * 2 : total = total
    "| TOTAL         | $#{fix_width(format('%.2f', total))} |
    |=================================|
    "
  end

  def fix_width(input)
    input = input.to_s
    input.length <= 13? ((13 - input.length).times { input << " " }) : (input = input[0...13])
    return input + " "
  end

end
