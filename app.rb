require './lib/controller.rb'

class CourierBot < Controller
  def add_ten
    3.times { new_parcel(9, 8, 7, 0.5) }
    2.times { new_parcel(49, 38, 27, 5) }
    2.times { new_parcel(99, 88, 77, 5) }
    1.times { new_parcel(209, 108, 97, 5) }
    1.times { new_parcel(9, 8, 7, 51) }
    1.times { new_parcel(49, 38, 27, 201) }
    puts('10 Parcels added!')
  end

  def add_thirty
    5.times { new_parcel(9, 8, 7, 0.5) }
    5.times { new_parcel(49, 38, 27, 5) }
    5.times { new_parcel(99, 88, 77, 5) }
    5.times { new_parcel(209, 108, 97, 5) }
    5.times { new_parcel(9, 8, 7, 51) }
    5.times { new_parcel(49, 38, 27, 201) }
    puts('25 Parcels added!')
  end

  def add_fifty
    15.times { new_parcel(9, 8, 7, 0.5) }
    15.times { new_parcel(49, 38, 27, 5) }
    5.times { new_parcel(99, 88, 77, 5) }
    5.times { new_parcel(209, 108, 97, 5) }
    5.times { new_parcel(9, 8, 7, 51) }
    5.times { new_parcel(49, 38, 27, 201) }
    puts('50 Parcels added!')
  end
end
