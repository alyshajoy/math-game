require_relative 'player'
require_relative 'number_generator'

class Game

  def initialize
    @player1 = Player.new("Player 1", true)
    @player2 = Player.new("Player 2", false)
    @number_generator = NumberGenerator.new
  end

  def generate_math_problem
    numbers = @number_generator.generate_numbers
    question = "What does #{numbers[0]} times #{numbers[1]} equal?"
    answer = numbers[0] * numbers[1]
    { question: question, answer: answer }
  end

  def player_answer_prompt
    print ">"
    gets.chomp.to_i  # Convert input to integer
  end

  def game_loop

    current_player = @player1
    
    loop do

      response = generate_math_problem
      question = response[:question]
      correct_answer = response[:answer]

      puts "#{current_player.name}: #{question}"
      player_answer = player_answer_prompt

      if player_answer == correct_answer
        puts "#{current_player}: YES! You are correct!"
      else
        puts "#{current_player}: Oops! You need to practice your times tables!"
        current_player.lose_life
        if current_player.lives < 1
          puts "GAME OVER"
          break
        end
      end

      puts "Current player: #{current_player.name}"
      puts "P1: #{@player1.lives}/3, P2: #{@player2.lives}/3"

      if current_player == @player1
        current_player = @player2
      else
        current_player = @player1
      end
      
    end

  end

end