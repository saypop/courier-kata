def generate_small_sizer
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return(:Small)
  sizer
end

def generate_medium_sizer
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return(:Medium)
  sizer
end

def generate_large_sizer
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return(:Large)
  sizer
end

def generate_xl_sizer
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return(:XL)
  sizer
end

def generate_zero_weigher
  weigher = double('weigher')
  allow(weigher).to receive(:excess_weight).and_return(0)
  weigher
end

def generate_five_weigher
  weigher = double('weigher')
  allow(weigher).to receive(:excess_weight).and_return(5)
  weigher
end

def generate_heavy_weigher
  weigher = double('weigher')
  allow(weigher).to receive(:excess_weight).and_return(50)
  weigher
end

def generate_small_parcel
  double('Parcel', :length => 9, :width => 8, :height => 7, :weight => 0.5)
end

def generate_heavy_parcel
  double('Parcel', :length => 9, :width => 8, :height => 7, :weight => 51)
end

def generate_medium_parcel
  double('Parcel', :length => 49, :width => 38, :height => 27, :weight => 5)
end

def generate_very_heavy_parcel
  double('Parcel', :length => 49, :width => 38, :height => 27, :weight => 201)
end

def generate_large_parcel
  double('Parcel', :length => 99, :width => 88, :height => 77, :weight => 5)
end

def generate_xl_parcel
  double('Parcel', :length => 209, :width => 108, :height => 97, :weight => 5)
end

def generate_small_calculator
  calculator = double('Calculator', :parcel_cost => 3.00, :batch_cost => 9.00,
    :weight_cost => 50.00, :size_cost => 3.00)
  calculator
end

def generate_heavy_calculator
  calculator = double('Calculator', :parcel_cost => 50.00,
    :weight_cost => 50.00, :size_cost => 101.00)
  calculator
end

def generate_batch(*parcels)
  double('Batch', :parcels => parcels)
end

def generate_batch_object
  batch_object = []
  2.times{batch_object << generate_heavy_parcel}
  5.times{batch_object << generate_small_parcel}
  7.times{batch_object << generate_medium_parcel}
  5.times{batch_object << generate_large_parcel}
  # 5.times{batch_object << generate_xl_parcel}
  # 3.times{batch_object << generate_very_heavy_parcel}
  batch_object
end
