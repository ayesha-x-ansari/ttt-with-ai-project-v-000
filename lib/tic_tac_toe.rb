require 'pry'
class TicTacToe
  def call
    input = ""
    puts "*********************"
    puts input
    while input != "exit"
      puts input
      puts "Welcome to Tic Tac Toe Game!"
      puts "Type 1 for game between 2 computers."
      puts "Type 2 for game between a computer and a player."
      puts "Type 3 for game between 2 palyers."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      case input
        when "1"
          two_computer_game
        when "2"
          computer_vs_player_game
        when "3"
          two_player_game
      end
    end
  end

  def two_computer_game
    #player1 = Players::Computer.new('X')
    #player2 = Players::Computer.new('O')
    #Game.new(player1, player2).play
    Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
  end

  def computer_vs_player_game
  #  player1 = Players::Computer.new('X')
  #  player2 = Players::Human.new('O')
  #  Game.new(player1, player2).play
    choice = []
    puts 'Choose your Token (Enter X or O)'
    choice[0] = gets.strip
    until %w(X x O o).include?(choice[0])
      puts 'Invalid Input!'
      puts 'Choose your Token (Enter X or O)'
      choice[0] = gets.strip
    end


    player2_token = choice[0].upcase == 'X' ? 'O' : 'X'

    player_1 = Players::Human.new(choice[0].upcase)
    player_2 = Players::Computer.new(player2_token)

  end

  def two_player_game
    puts 'Who should go first X or O (Enter X or O)'
    choice = gets.strip
    until ["X","O"].include?(choice.upcase)
      puts "Invalid Input!"
      puts 'Who should go first X or O (Enter X or O)'
      choice = gets.strip
    end
    #choice2 = choice.upcase == 'X' ? 'O' : 'X'
    player2 = choice.upcase == 'X' ? 'O' : 'X'
    #player1 = Players::Human.new(choice.upcase)
    #player2 = Players::Human.new(choice2)
    #Game.new(player1, player2).play

    Game.new(Players::Human.new(choice.upcase), Players::Human.new(player2)).play
    puts 'Do you want to play again? (Enter Y OR N)'
    choice = gets.strip
    if choice.upcase == "Y"
      input = "-1"
      puts input
    else
      input = "exit"
      puts input
    end
  end
end
