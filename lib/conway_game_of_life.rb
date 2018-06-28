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
      for i in 0..height 
        for j in 0..width
            print @map[i][j]
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

    
  end
end 
