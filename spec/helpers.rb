def small_sizer()
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return('Small')
  sizer
end

def medium_sizer()
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return('Medium')
  sizer
end

def large_sizer()
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return('Large')
  sizer
end
