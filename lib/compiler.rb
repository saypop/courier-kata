require_relative 'sizer'
require_relative 'weigher'
require_relative 'calculator'

class Compiler
  attr_reader :sizer, :calculator

  def initialize(sizer: Sizer.new, weigher: Weigher.new,
                 calculator: Calculator.new(sizer: sizer, weigher: weigher))
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
    type = sizer.categorise(parcel)
    type = 'Heavy' if @calculator.weight_cost(parcel) < @calculator.size_cost(parcel)
    if parcel
      "| #{fix_width(type)}| $#{fix_width(format('%.2f', calculator.parcel_cost(parcel)))} |
      |---------------------------------|
      "
    end
  end

  def batch_output(batch)
    string = ''
    batch.parcels.each { |parcel| string << parcel_output(parcel) } if batch
    string
  end

  def speedy_output(batch)
    "| Speedy        | $#{fix_width(format('%.2f', calculator.batch_cost(batch)))} |
    |---------------------------------|
    "
  end

  def discount_output(batch)
    "| Discount      | -$#{fix_width(format('%.2f', calculator.discount(batch)))}|
    |---------------------------------|
    "
  end

  def footer(batch, speedy = false)
    total = calculator.batch_cost(batch)
    total = speedy ? total * 2 : total
    "| TOTAL         | $#{fix_width(format('%.2f', total))} |
    |=================================|
    "
  end

  def fix_width(input)
    input = input.to_s
    input.length <= 13 ? ((13 - input.length).times { input << ' ' }) : (input = input[0...13])
    input + ' '
  end
end
