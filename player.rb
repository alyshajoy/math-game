class Player

  def initialize(name, turn)
    @name = name
    @lives = 3
    @current_turn = turn
  end

  attr_accessor :name, :lives, :current_turn

  def switch_turn
    @current_turn = !@current_turn
  end

  def lose_life
    @lives -= 1
  end

end