require_relative "board"
require_relative "human_player"

class Game 
    attr_reader :current_player, :player_1, :player_2

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
    end 

    def switch_turn
         @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
         
    end 

    def play
        board = Board.new
        while board.empty_positions? == true
            board.print
            board.place_mark(@current_player.get_position, @current_player)
            if board.win?(@current_player)
                return "Victory!"
            else 
               self.switch_turn
            end
        end 
        p "Draw!"
    end 


end 

