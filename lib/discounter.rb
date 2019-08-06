require_relative 'calculator'

class Discounter

  attr_reader :discount_object, :discount_amount

  def initialize
    @discount_amount = 0.0
    @discount_object = { :Small => [], :Medium => [], :Other => []}
  end

  def process_discount(batch_object, calculator)
    @discount_amount = 0.0
    @discount_object = { :Small => [], :Medium => [], :Other => []}
    create_discount_object(batch_object, calculator)
    process_small_discount(@discount_object[:Small])
    process_medium_discount(@discount_object[:Medium])
    process_other_discount(
      @discount_object[:Small],
      @discount_object[:Medium],
      @discount_object[:Other])
    @discount_amount
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

  def process_other_discount(small_list, medium_list, other_list)
    parcels = (small_list + medium_list + other_list).sort
    until parcels.length < 5
       p @discount_amount = @discount_amount + parcels[0]
       p parcels.slice!(0, 5)
    end
    @discount_object = { :Small => [], :Medium => [], :Other => []}
  end





end
