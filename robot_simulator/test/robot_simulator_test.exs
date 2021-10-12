defmodule RobotSimulatorTest do
  use ExUnit.Case
  doctest RobotSimulator

  test "greets the world" do
    assert RobotSimulator.hello() == :world
  end

  describe "parsing file" do
    test "read the basic example" do
      assert RobotSimulator.read_input("test/example.txt") == %{ position: [0, 0], orientation: :north, instructions: [:move, :report] }
    end
    
    test "read the second example" do
      assert RobotSimulator.read_input("test/example_b.txt") == %{ position: [0, 0], orientation: :north, instructions: [:left, :report] }
    end

    test "read the third example" do
      assert RobotSimulator.read_input("test/example_c.txt") == %{ position: [1, 2], orientation: :east, instructions: [:move, :move, :left, :move, :report] }
    end
  end
end