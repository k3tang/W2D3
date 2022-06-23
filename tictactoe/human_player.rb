require_relative "board"

class HumanPlayer

    attr_writer :mark

    def initialize(mark_value)
        @mark = mark_value
    end 

    def get_position
        alphabet = ("a".."z").to_a
       begin p "Enter a position, 2 numbers between 0-2 with a space between representing the row and col. Example 'row col' = '1 2'."
        response = gets.chomp
        position = []
        position << response[0].to_i 
        position << response[2].to_i

         spaces = 0
            response.each_char do |char| 
                if char  == " "
                    spaces += 1 
                end 
            end

        self.exceptions(position)
        board.place_mark(position, mark)

        rescue wrong_length
    
        rescue no_alphas
    
        rescue spaces_much
    
        rescue out_bounds
    
        rescue exist_already
            retry
        end 
    end 

    def exceptions(position)
        if response.length != 3 
            raise wrong_length = ArgumentError.new "Please reenter the correct amount of numbers."
            
        elsif no_alphas = alphabet.include?(response[0]) || alphabet.include?(response[2])
            raise ArgumentError.new "Numbers only!"

        elsif  
            if spaces > 1 
                raise spaces_much = ArgumentError.new "Please enter with correct formatting."
                
            end 
          
        end 
    end 

end 