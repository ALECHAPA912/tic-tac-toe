require './player'

class Game
  attr_reader :print_board, :board
  def initialize
    @players = [Player.new("X", self), Player.new("O", self)]
    @current_player_id = 0
    @board = Array.new(9)
    @print_board = "0 1 2\n3 4 5\n6 7 8"
  end
  def play
    puts "Welcome to Alejandro's TIC TAC TOE Game!"
    puts @print_board
    loop do
      puts "It's your turn player #{@current_player_id + 1}!\nPut your marker (#{@players[@current_player_id].marker}) in one position (0-8)"
      selection = gets.to_i
      do_a_play(@players[@current_player_id], selection)
      puts @print_board
      if anywinner?
        puts "CONGRATULATIONS PLAYER #{@current_player_id + 1} YOU WON THE GAME!"
        break
      end
      if draw?
        puts "I'TS A DRAW! PLAY AGAIN"
        break
      end
      switch_player_id
    end
  end
  def switch_player_id
    if(@current_player_id == 0)
      @current_player_id = 1
    else
      @current_player_id = 0
    end
  end
  def anywinner?
    if (@board[0] == @players[@current_player_id].marker && @board[1] == @players[@current_player_id].marker && @board[2] == @players[@current_player_id].marker)
      return true
    elsif (@board[3] == @players[@current_player_id].marker && @board[4] == @players[@current_player_id].marker && @board[5] == @players[@current_player_id].marker)
      return true
    elsif (@board[6] == @players[@current_player_id].marker && @board[7] == @players[@current_player_id].marker && @board[8] == @players[@current_player_id].marker)
      return true
    elsif (@board[0] == @players[@current_player_id].marker && @board[3] == @players[@current_player_id].marker && @board[6] == @players[@current_player_id].marker)
      return true
    elsif (@board[1] == @players[@current_player_id].marker && @board[4] == @players[@current_player_id].marker && @board[7] == @players[@current_player_id].marker)
      return true
    elsif (@board[2] == @players[@current_player_id].marker && @board[5] == @players[@current_player_id].marker && @board[8] == @players[@current_player_id].marker)
      return true
    elsif (@board[0] == @players[@current_player_id].marker && @board[4] == @players[@current_player_id].marker && @board[8] == @players[@current_player_id].marker)
      return true
    elsif (@board[2] == @players[@current_player_id].marker && @board[4] == @players[@current_player_id].marker && @board[6] == @players[@current_player_id].marker)
      return true
    else 
      return false
    end
  end
  def draw?
    board_full? && !(anywinner?)
  end
  def board_full?
    return false if @board.any?(nil)
    return true
  end
  def put_marker(position)
    @print_board = @print_board.gsub(position.to_s, @players[@current_player_id].marker)
  end
  def do_a_play(player, selection)
    sel = selection
    loop do
      if @board[sel] == nil
        @board[sel] = @players[@current_player_id].marker
        put_marker(sel)
        break
      end
      puts "Choose another position, this one is already played"
      sel = gets.to_i
    end
  end
end
