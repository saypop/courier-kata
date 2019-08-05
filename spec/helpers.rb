def small_sizer()
  sizer = double('Sizer')
  allow(sizer).to receive(:categorise).and_return('Small')
  sizer
end
