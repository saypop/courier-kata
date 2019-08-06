require_relative 'batch'
require_relative 'calculator'
require_relative 'compiler'
require_relative 'parcel'
require_relative 'sizer'

class Controller

  attr_reader :batch, :calculator, :compiler, :sizer

  def initialize(batch = Batch.new, compiler = Compiler.new(sizer = Sizer.new,
    calculator = Calculator.new))
    @batch = batch
    @calculator = calculator
    @compiler = compiler
    @sizer = sizer
  end

  def new_parcel(length, width, height, parcel_class = Parcel)
    parcel = parcel_class.new(length, width, height)
    @batch.add(parcel)
  end

  def get_quote(speedy: false)
    compiled_quote = @compiler.header
    compiled_quote += @compiler.batch_output(@batch)
    compiled_quote += @compiler.speedy_output(@batch) if speedy
    compiled_quote += @compiler.footer(@batch)
    puts(compiled_quote)
  end

end
