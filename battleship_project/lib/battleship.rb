require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n * n/2
    end 

   def start_game
    @board.place_random_ships
    @board.num_ships
    @board.print 
   end 

   def lose?
    if @remaining_misses <= 0 
        p "you lose"
        return true 
    else 
        return false 
    end 
     end 

    def win?
       if @board.num_ships > 0
        return false
       else 
         puts "you win"
         return true
       end 
    end 

    def game_over?
        (lose? || win?) ? true : false
    end 

    def turn 
       pos = @player.get_move
        if @board.attack(pos)
            @board.print
            print @remaining_misses
        else 
            print @remaining_misses -= 1
            @board.print
        end 
    end 




end
