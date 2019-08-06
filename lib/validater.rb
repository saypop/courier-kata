class Validater

  attr_reader :pre_menu_options, :main_menu_options, :yes_no_options

  def initialize
    @pre_menu_options = { 'exit' => :exit, 'start' => :start, 'back' => :exit }
    @main_menu_options = {
      1 => :one, 2 => :two, 3 => :three, 4 => :four,
      5 => :five, 0 => :exit, 'exit' => :exit, 'back' => :exit
    }
    @yes_no_options = {
      'yes' => :yes, 'no' => :no, 'back' => :back, 'exit' => :exit
    }
  end

  def pre_menu_choice(selection)
    validate_output(@pre_menu_options[selection])
  end

  def main_menu_choice(selection)
    validate_output(@main_menu_options[selection])
  end

  def yes_no_choice(selection)
    validate_output(@yes_no_options[selection])
  end

  def validate_output(output)
    return :invalid if output.nil?
    output
  end

end
