require 'receiver'

describe Receiver do
  let(:receiver) {described_class.new()}

  describe '#initialize' do
    it 'contains a list of acceptable pre menu inputs' do
      expect(receiver.pre_menu_options).to eq({
        'exit' => :exit, 'start' => :start, 'back' => :exit
        })
    end

    it 'contains a list of acceptable main menu options' do
      expect(receiver.main_menu_options).to eq({
        1 => :one, 2 => :two, 3 => :three, 4 => :four,
        5 => :five, 0 => :exit, 'exit' => :exit
      })
    end
  end

  describe '#pre_menu_choice' do
    it 'returns nil when given an invalid option' do
      expect(receiver.pre_menu_choice('foo')).to eq nil
    end

    it 'returns :exit when given exit as an argument' do
      expect(receiver.pre_menu_choice('exit')).to eq :exit
    end

    it 'returns :start when given start as an argument' do
      expect(receiver.pre_menu_choice('start')).to eq :start
    end

    it 'returns :exit when given back as an argument' do
      expect(receiver.pre_menu_choice('back')).to eq :exit
    end
  end

  describe '#main_menu_choice' do
    it 'returns nil when given an invalid option' do
      expect(receiver.main_menu_choice('foo')).to eq nil
    end

    it 'returns :one when given 1 as an option' do
      expect(receiver.main_menu_choice(1)).to eq :one
    end

  end

end
