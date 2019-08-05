class Menu

  attr_reader :options

  def initialize
    @options = {
      :welcome => "Hello world"
    }
  end

end
