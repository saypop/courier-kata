require_relative 'calculator'

class Discounter

  attr_reader :discount_object, :discount_amount

  def initialize
    @discount_amount = 0.0
    @discount_object = { :Small => [], :Medium => [], :Other => []}
  end

  def create_discount_object(batch_object, calculator)
    # @discount_object = { :Small => [], :Medium => [], :Other => []}
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
  end

  def process_small_discount(small_list)
    parcels = small_list.sort
    until parcels.length < 3
      @discount_amount += parcels[0]
      parcels.slice!(0, 3)
    end
    @discount_object[:Small] = parcels
  end

  def process_medium_discount(medium_list)
    parcels = medium_list.sort
    until parcels.length < 4
       @discount_amount = @discount_amount + parcels[0]
       parcels.slice!(0, 4)
    end
    @discount_object[:Medium] = parcels
  end





end
