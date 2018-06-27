class GameOfLife
    # def initialize_array(height, width)
    #     @height = height
    #     @width = width
    # end

    grid_array = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    grid_height = 3
    grid_width = 3

    #define grid_array, grid_height, grid_width

  
  def count_neighbors(x, y)
    neighbors = 0
    height_dir = Array[0, 1, 1, 1, 0, -1, -1, -1]
    width_dir = Array[-1, -1, 0, 1, 1, 1, 0, -1]
    for i in 0..height_dir.length
        height_check = y + height_dir[i]
        width_check = x + width_dir[i]
        if ((height_check >= 0 && height_check < grid_height) && (width_check >= 0 && width_check < grid_width) && (grid_array[height_check][width_check] == 1)) then
            neighbors += 1
        end
    end
    neighbors
  end
end
