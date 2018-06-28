require "./lib/conway_game_of_life.rb"
require "test/unit"

module GameOfLife
  class SpecConwayGameOfLife < Test::Unit::TestCase
    def test_initialize
      y = 10
      x = 10
      grid = Array.new(y){Array.new(x, 0)}

      universe = Universe.new(y, x, grid)
      assert_equal(x, universe.width)
      assert_equal(y, universe.height)
      assert_equal(grid, universe.grid)
    end


  end
end
