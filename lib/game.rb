class Game
  attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [
	      [0,1,2],
	      [3,4,5],
	      [6,7,8],
	      [0,3,6],
	      [1,4,7],
	      [2,5,8],
	      [0,4,8],
	      [6,4,2]
	  ]
  #def initialize(player_1, player_2 , board = Board.new)
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
	  @player_1 = player_1
	  @player_2 = player_2
	  @board = board
	end

	def current_player
	  @board.turn_count.even? ? player_1 : player_2
    #board.turn_count % 2 == 0 ? player_1 : player_2  same as above code
	end

  def over?
	  won? || draw?
	end

	def won?
	  WIN_COMBINATIONS.find do |winner|
      # winner 0 means first postion we are checking in our winner array
      # winner 1 means second postion we are checking in our winner array
      # winner 2 means third postion we are checking in our winner array
      @board.cells[winner[0]]  ==  @board.cells[winner[1]]  &&
      @board.cells[winner[1]]  ==  @board.cells[winner[2]]  &&
      (@board.cells[winner[0]]  == "X"  ||  @board.cells[winner[0]]  == "O")

 	  end
  end

	def draw?
	  board.full? && !won?
	end

	def winner

    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
	end


  def turn
	  @board.display
	  puts "Please enter 1-9, player #{current_player.token}"

	  input = current_player.move(board)
	  if @board.valid_move?(input)
	    @board.update(input, current_player)
	   else
	      puts 'Invalid Input or spot taken! Enter again!'
	      turn
	   end
	end

  def play
	   until over?
	     turn
	   end
	   @board.display
	   if winner
	     puts "Congratulations #{winner}!"
	   elsif draw?
	     puts "Cat's Game!"
	   end
	 end

  end
