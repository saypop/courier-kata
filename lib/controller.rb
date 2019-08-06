require_relative 'batch'
require_relative 'calculator'
require_relative 'compiler'
require_relative 'parcel'
require_relative 'sizer'
require_relative 'discounter'

class Controller

  attr_reader :batch, :compiler, :discounter

  def initialize(batch = Batch.new, compiler = Compiler.new)
    @batch = batch
    @compiler = compiler
  end

  def new_parcel(length, width, height, weight, parcel_class = Parcel)
    parcel = parcel_class.new(length, width, height, weight)
    @batch.add(parcel)
  end

  def get_quote(speedy: false)
    compiled_quote = @compiler.header
    compiled_quote += @compiler.batch_output(@batch)
    compiled_quote += @compiler.speedy_output(@batch) if speedy
    compiled_quote += @compiler.footer(@batch, speedy)
    puts(compiled_quote)
  end

end
