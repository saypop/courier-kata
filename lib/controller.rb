require_relative 'calculator'
require_relative 'compiler'
require_relative 'menu'
require_relative 'printer'
require_relative 'validater'
require_relative 'sizer'

class Controller

  attr_reader :calculator, :compiler, :menu, :printer, :validater, :sizer,
  :batch_number

  def initialize(calculator = Calculator.new, compiler = Compiler.new,
    menu = Menu.new, printer = Printer.new, validater = Validater.new,
    sizer = Sizer.new)
    @calculator = calculator
    @compiler = compiler
    @menu = menu
    @printer = printer
    @validater = validater
    @sizer = sizer
    @batch_number = 1
  end

  def launch
    @printer.print_output(@menu.options[:welcome_message])
    # user_selection = :invalid
    # while user_selection == :invalid
    #   @validater.validate_output(@validater.get_input)
  end

end
