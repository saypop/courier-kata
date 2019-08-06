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

def generate_small_parcel
  double('Parcel', :length => 9, :width => 8, :height => 7, :weight => 0.5)
end

def generate_medium_parcel
  double('Parcel', :length => 49, :width => 38, :height => 27, :weight => 5)
end

def generate_large_parcel
  double('Parcel', :length => 99, :width => 88, :height => 77)
end

def generate_xl_parcel
  double('Parcel', :length => 209, :width => 108, :height => 97)
end

def generate_small_calculator
  calculator = double('Calculator', :parcel_cost => 3.00, :batch_cost => 9.00)
  calculator
end

def generate_batch(*parcels)
  double('Batch', :parcels => parcels)
end
