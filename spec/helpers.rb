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

def generate_small_parcel
  double('Parcel', :name => 'Small Box', :length => 9, :width => 8, :height => 7)
end

def generate_medium_parcel
  double('Parcel', :name => 'Medium Box', :length => 49, :width => 38, :height => 27)
end

def generate_large_parcel
  double('Parcel', :name => 'Large Box', :length => 99, :width => 88, :height => 77)
end

def generate_xl_parcel
  double('Parcel', :name => 'XL Box', :length => 209, :width => 108, :height => 97)
end

def generate_small_calculator
  double('Calculator', :parcel_cost => 3.00)
end
