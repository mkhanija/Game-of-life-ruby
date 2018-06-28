module GameOfLife
  class Universe
    def initialize(height, width, grid)
      @height = height
      @width = width
      @grid = grid
    end

    def height 
      @height
    end

    def width 
      @width
    end

    def grid 
      @grid
    end
    
    def print_universe
      for i in 0..@height -1
        for j in 0..@width -1
            print @grid[i][j]
        end
        print "\n"
      end
    end

    def count_neighbors(x, y)
      neighbors = 0
      height_dir = Array[0, 1, 1, 1, 0, -1, -1, -1]
      width_dir = Array[-1, -1, 0, 1, 1, 1, 0, -1]
      for i in 0..7
        height_check = y + height_dir[i]
        width_check = x + width_dir[i]
        if ((height_check >= 0 && height_check < grid.length) && (width_check >= 0 && width_check < grid[0].length) && (@grid[height_check][width_check] == 1)) then
          neighbors += 1
        end
      end
      neighbors
    end

    def process_universe
      new_universe = Array.new(@height){Array.new(@width, 0)}
      for y in 0..@height - 1
        for x in 0..@width - 1
          neighbors = count_neighbors(x, y)
          if @grid[y][x] == 1
            if neighbors < 2 
              new_universe[y][x] = 0
            elsif neighbors == 2 || neighbors == 3 
              new_universe[y][x] = 1
            else 
              new_universe[y][x] = 0
            end
          else 
            if neighbors == 3
              new_universe[y][x] = 1
            end
          end
        end
      end
      @grid = new_universe
      return new_universe
    end

  end

  input_array = File.readlines('input.txt')
  input_array_int = Array.new(input_array.length){Array.new(input_array[0].length, 0)}
  for y in 0..input_array.length - 1
    for x in 0..input_array[0].length - 1
      input_array_int[y][x] = input_array[y][x].to_i
    end
  end
  universe = Universe.new(input_array_int.length, input_array_int[0].length, input_array_int)
  
  for i in 0..15
    universe.print_universe
    print "----------------------\n"
    universe.process_universe
  end
  
end 
