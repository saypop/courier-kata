require_relative 'calculator'

class Discounter

  attr_reader :discount_object

  def initialize
    @discount_object = { :Small => [], :Medium => [], :Other => []}
  end

  def create_discount_object(batch_object, calculator)
    batch_object.each do |parcel|
      cost = calculator.parcel_cost(parcel)
      case calculator.get_type(parcel)
      when :Small
        @discount_object[:Small] << cost
      when :Medium
        @discount_object[:Medium] << cost
      else
        @discount_object[:Other] << cost
      end
    end
    @discount_object[:Small].sort!
    @discount_object[:Medium].sort!
    @discount_object[:Other].sort!
  end


end
