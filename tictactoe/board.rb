require_relative "human_player"

class Out_boundsError < StandardError
    def message
        "out of bounds"
    end
end 

class ExistError < StandardError
    def message 
        v


class Board
attr_reader :grid
    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end 

    def [](position)
        @grid[position[0]][position[1]]
    end 
    
    def []=(position, mark)
        @grid[position[0]][position[1]] = mark
    end 

    def valid?(position)
        position.each do |idx|
            if (idx > 2) || (idx < 0)
                return false 
            end  
        end 
        true
    end 

    def empty?(position)
        if self[position] == "_" 
            return true 
        else 
            return false 
        end 
    end 

    def place_mark(position, mark)
         self.valid?(position) && self.empty?(position)
            self[position] = mark
        elsif self.valid?(position) == false 
            raise Out_boundsError
        else self.empty?(position) == false
            raise 
        end 
    end 

    def print
        @grid.each do |array|
            p array
        end 
    end 

    def win_row?(mark)
        @grid.each do |array|
            if array.uniq.count == 1 && array.uniq == [mark]
                return true 
            end 
        end 
        false 
    end 

    def win_col?(mark)
        @grid.transpose.each do |array| 
            if array.uniq.count == 1 && array.uniq == [mark]
                return true 
            end 
        end 
        false 
    end 

    def win_diagonal?(mark) 
       first_diag = @grid.map.with_index {|ele, idx| @grid[idx][idx]}
       sec_diag = @grid.map.with_index {|ele, idx| @grid[idx][-idx - 1]}
        diags = [first_diag, sec_diag]
        diags.each do |dia|
            if dia.uniq.count == 1 && dia.uniq == [mark]
                return true 
            end 
        end 
    false 
    end

    def win?(mark)
        win_array = [self.win_row?(mark), self.win_col?(mark), self.win_diagonal?(mark)]
        win_array.any? ? true : false
    end 

    def empty_positions?
      if @grid.flatten.count("_") > 0
        return true 
      else 
        return false 
      end 
    end 
               

end 