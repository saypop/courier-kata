require_relative 'calculator'
require_relative 'compiler'
require_relative 'menu'
require_relative 'printer'
require_relative 'receiver'
require_relative 'sizer'

class Controller

  attr_reader :calculator, :compiler, :menu, :printer, :receiver, :sizer,
  :batch_number

  def initialize(calculator = Calculator.new, compiler = Compiler.new,
    menu = Menu.new, printer = Printer.new, receiver = Receiver.new,
    sizer = Sizer.new)
    @calculator = calculator
    @compiler = compiler
    @menu = menu
    @printer = printer
    @receiver = receiver
    @sizer = sizer
    @batch_number = 1
  end

  def launch
    @printer.print_output(@menu.options[:welcome_message])
  end

end
