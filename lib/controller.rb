require_relative 'batch'
require_relative 'calculator'
require_relative 'compiler'
require_relative 'menu'
require_relative 'printer'
require_relative 'receiver'
require_relative 'parcel'
require_relative 'validater'
require_relative 'sizer'

class Controller

  attr_reader :calculator, :compiler, :menu, :printer, :receiver, :validater, :sizer,
  :batch_number

  def initialize(calculator = Calculator.new, compiler = Compiler.new,
    menu = Menu.new, printer = Printer.new, receiver = Receiver.new, validater = Validater.new,
    sizer = Sizer.new)
    @calculator = calculator
    @compiler = compiler
    @menu = menu
    @printer = printer
    @receiver = receiver
    @validater = validater
    @sizer = sizer
    @batch_number = 1
  end

  def launch
    @batch = Batch.new(@batch_number)
    @printer.puts_output(@menu.options[:welcome_message])
    process_choice(@validater.method(:pre_menu_choice), method(:pre_menu_success))
  end

  def process_choice(choice_method, success_method)
    user_selection = :invalid
    while user_selection == :invalid
      user_selection = choice_method.call(@receiver.get_input)
      @printer.puts_output(@menu.options[:request_repeat]) if user_selection == :invalid
    end
    success_method.call(user_selection)
  end

  def process_input(choice_method, success_method, attribute)
    user_selection = :invalid
    while user_selection == :invalid
      user_selection = choice_method.call(@receiver.get_input)
      @printer.puts_output(@menu.options[:request_repeat]) if user_selection == :invalid
    end
    success_method.call({ attribute.to_sym => user_selection })
  end

  def pre_menu_success(user_selection)
    case user_selection
    when :exit
      @printer.puts_output(@menu.options[:exit_message])
      exit
    when :start
      @printer.puts_output(@menu.options[:get_started])
      sleep 1
      main_menu_select
    end
  end

  def main_menu_select
    @printer.puts_output(@menu.options[:main_menu])
    process_choice(@validater.method(:main_menu_choice), method(:main_menu_success))
  end

  def main_menu_success(user_selection)
    case user_selection
    when :one
      add_parcel_to_batch
    when :two
      get_quote_for_parcel
    # when :three
    #   view_current_batch
    # when :four
    #   get_quote_for_batch
    # when :five
    #   start_new_batch
    # when :exit
    #   shut_down
    end
  end

  def add_parcel_to_batch
    @printer.puts_output(@menu.options[:add_parcel])
    parcel = Parcel.new
    sleep 1
    get_parcel_details(parcel)
    @batch.add(parcel)
    @printer.puts_output(@menu.options[:parcel_added])
    sleep 1
    main_menu_select
  end

  def get_parcel_details(parcel)
    @printer.puts_output(@menu.options[:request_name])
    name = @receiver.get_input
    parcel.update(name: name) if name != ""
    @printer.puts_output(@menu.options[:request_length])
    process_input(@validater.method(:validate_integer), parcel.method(:update), 'length')
    @printer.puts_output(@menu.options[:request_width])
    process_input(@validater.method(:validate_integer), parcel.method(:update), 'width')
    @printer.puts_output(@menu.options[:request_height])
    process_input(@validater.method(:validate_integer), parcel.method(:update), 'height')
  end

  def get_quote_for_parcel
    @printer.puts_output(@menu.options[:get_started])
    parcel = Parcel.new
    sleep 1
    get_parcel_details(parcel)
    compiled_table = @compiler.header + @compiler.parcel_output(parcel)
    printer.puts_output(compiled_table)

  end

  # def view_current_batch
  #
  # end
  #
  # def get_quote_for_batch
  #
  # end
  #
  # def start_new_batch
  #
  # end
  #
  # def shut_down
  #   @printer.puts_output(@menu.options[:confirm_exit])
  # end

end
