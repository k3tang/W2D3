class Board

attr_reader :size

  def initialize(n)
    @grid = Array.new(n){Array.new(n, :N)}
    @size = n * n
  end 

  def [](array)
    @grid[array[0]][array[1]] 
  end 

  def []=(position, value)
     @grid[position[0]][position[1]] = value
  end 

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(position)
    if self[position] == :S
      self[position]= :H
      p 'you sunk my battleship!'
      return true 
    else 
      self[position]= :X
      return false
    end 
  end 

  def place_random_ships
    n = @grid.length

     until self.num_ships == (self.size/4)
      random_num_row = rand(0...n)
      random_num_col = rand(0...n)
         rand_pos = [random_num_row, random_num_col]
        self[rand_pos] = :S
      end
    p self.size/4
  end

  def hidden_ships_grid
    n = @grid.length
    hidden_grid = Array.new(n){Array.new(n, :N)}

    @grid.each.with_index do |subarray, idx1|
      subarray.each.with_index do |num, idx2|
        if @grid[idx1][idx2] == :S 
          hidden_grid[idx1][idx2] = :N 
        else 
          hidden_grid[idx1][idx2] = @grid[idx1][idx2]
        end 
      end
   end 
   hidden_grid
  end 

  def self.print_grid(arrays)
    arrays.each do |array|
      puts "#{array.join(" ")}"
    end 
  end 

  def cheat
    Board.print_grid(@grid)
  end 

  def print 
    Board.print_grid(hidden_ships_grid)
  end 

end
