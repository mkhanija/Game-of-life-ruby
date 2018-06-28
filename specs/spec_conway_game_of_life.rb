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

    def test_count_neighbors
      tester = Array.new(3){Array.new(3, 0)}
      
      tester[0][0] = 1
      tester[1][0] = 1
      tester[2][0] = 1

      universe = Universe.new(3, 3, tester)

      assert_equal(3, universe.count_neighbors(1, 1))
      assert_equal(1, universe.count_neighbors(0, 0))
      assert_equal(2, universe.count_neighbors(0, 1))
      assert_equal(1, universe.count_neighbors(0, 2))
      
      tester[0][1] = 1
      tester[0][2] = 1
      tester[1][2] = 1
      tester[2][1] = 1
      tester[2][2] = 1

      universe = Universe.new(3, 3, tester)
      assert_equal(4, universe.count_neighbors(1, 2))
      assert_equal(2, universe.count_neighbors(2, 2))
      assert_equal(4, universe.count_neighbors(2, 1))
      assert_equal(2, universe.count_neighbors(2, 0))
    end

    def test_process_universe
      initial = Array.new(3){Array.new(3, 0)}
      initial[1][0] = 1
      initial[1][1] = 1
      initial[1][2] = 1

      universe = Universe.new(3, 3, initial)

      ans = Array.new(3){Array.new(3, 0)}
      ans[0][1] = 1
      ans[1][1] = 1
      ans[2][1] = 1

      new_universe = universe.process_universe

      assert_equal(ans, new_universe)
    end


  end
end
