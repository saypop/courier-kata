require 'validater'

describe Validater do
  let(:validater) {described_class.new()}

  describe '#initialize' do
    it 'contains a list of acceptable pre menu inputs' do
      expect(validater.pre_menu_options).to eq({
        'end' => :exit, 'start' => :start, 'back' => :exit
        })
    end

    it 'contains a list of acceptable main menu options' do
      expect(validater.main_menu_options).to eq({
        '1' => :one, '2' => :two, '3' => :three, '4' => :four,
        '5' => :five, '0' => :exit, 'end' => :exit, 'back' => :exit
      })
    end

    it 'contains a list of acceptable yes/no menu options' do
      expect(validater.yes_no_options).to eq({
        'yes' => :yes, 'no' => :no, 'back' => :back, 'end' => :exit
      })
    end
  end

  describe '#pre_menu_choice' do
    it 'returns :invalid when given an invalid option' do
      expect(validater.pre_menu_choice('foo')).to eq :invalid
    end

    it 'returns :exit when given exit as an argument' do
      expect(validater.pre_menu_choice('end')).to eq :exit
    end

    it 'returns :start when given start as an argument' do
      expect(validater.pre_menu_choice('start')).to eq :start
    end

    it 'returns :exit when given back as an argument' do
      expect(validater.pre_menu_choice('back')).to eq :exit
    end
  end

  describe '#main_menu_choice' do
    it 'returns :invalid when given an invalid option' do
      expect(validater.main_menu_choice('foo')).to eq :invalid
    end

    it 'returns :one when given 1 as an option' do
      expect(validater.main_menu_choice('1')).to eq :one
    end

    it 'returns :two when given 2 as an option' do
      expect(validater.main_menu_choice('2')).to eq :two
    end

    it 'returns :three when given 3 as an option' do
      expect(validater.main_menu_choice('3')).to eq :three
    end

    it 'returns :four when given 4 as an option' do
      expect(validater.main_menu_choice('4')).to eq :four
    end

    it 'returns :five when given 5 as an option' do
      expect(validater.main_menu_choice('5')).to eq :five
    end

    it 'returns :exit when given 0 as an option' do
      expect(validater.main_menu_choice('0')).to eq :exit
    end

    it 'returns :exit when given exit as an option' do
      expect(validater.main_menu_choice('end')).to eq :exit
    end

    it 'returns :exit when given back as an option' do
      expect(validater.main_menu_choice('back')).to eq :exit
    end

  end

  describe '#yes_no_choice' do
    it 'returns :invalid when given an invalid option' do
      expect(validater.yes_no_choice('foo')).to eq :invalid
    end

    it 'returns :yes when given yes as an option' do
      expect(validater.yes_no_choice('yes')).to eq :yes
    end

    it 'returns :no when given no as an option' do
      expect(validater.yes_no_choice('no')).to eq :no
    end

    it 'returns :back when given back as an option' do
      expect(validater.yes_no_choice('back')).to eq :back
    end

    it 'returns :exit when given exit as an option' do
      expect(validater.yes_no_choice('end')).to eq :exit
    end
  end

  describe '#validate_output' do
    it 'returns invalid when the output is nil' do
      expect(validater.validate_output(nil)).to eq :invalid
    end

    it 'returns the output when the output is not nil' do
      expect(validater.validate_output('not nil')).to eq 'not nil'
    end
  end

  describe '#validate_integer' do
    it 'returns invalid when the output is not a number' do
      expect(validater.validate_integer('foo')).to eq :invalid
    end

    it 'returns an integer when the input is an integer' do
      expect(validater.validate_integer('4')).to eq 4
    end
  end

end
