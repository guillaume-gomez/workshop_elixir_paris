defmodule RobotSimulatorTest do
  use ExUnit.Case
  doctest RobotSimulator

  test "greets the world" do
    assert RobotSimulator.hello() == :world
  end

  describe "parsing file" do
    test "should read the basic example" do
      assert RobotSimulator.read_input("test/example.txt") == %{ position: [0, 0], orientation: :north, instructions: [:move, :report] }
    end
    
    test "should read the second example" do
      assert RobotSimulator.read_input("test/example_b.txt") == %{ position: [0, 0], orientation: :north, instructions: [:left, :report] }
    end

    test "should read the third example" do
      assert RobotSimulator.read_input("test/example_c.txt") == %{ position: [1, 2], orientation: :east, instructions: [:move, :move, :left, :move, :report] }
    end
  end

  describe "move robot" do

    test "should rotate robot to the left when face north" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :north, instructions: [:left] }) == %{position: [0, 0], orientation: :west, instructions: [] }
    end

    test "should rotate robot to the right when face north" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :north, instructions: [:right] }) == %{position: [0, 0], orientation: :east, instructions: [] }
    end

    test "should rotate robot to the left when face west" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :west, instructions: [:left] }) == %{position: [0, 0], orientation: :south, instructions: [] }
    end

    test "should rotate robot to the right when face west" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :west, instructions: [:right] }) == %{position: [0, 0], orientation: :north, instructions: [] }
    end

    test "should rotate robot to the left when face east" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :east, instructions: [:left] }) == %{position: [0, 0], orientation: :north, instructions: [] }
    end

    test "should rotate robot to the right when face east" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :east, instructions: [:right] }) == %{position: [0, 0], orientation: :south, instructions: [] }
    end

    test "should rotate robot to the left when face south" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :south, instructions: [:left] }) == %{position: [0, 0], orientation: :east, instructions: [] }
    end

    test "should rotate robot to the right when face south" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0], orientation: :south, instructions: [:right] }) == %{position: [0, 0], orientation: :west, instructions: [] }
    end

    test "should move forward robot when face south" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1], orientation: :south, instructions: [:move] }) == %{position: [1, 0], orientation: :south, instructions: [] }
    end

    test "should move forward robot when face north" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1], orientation: :north, instructions: [:move] }) == %{position: [1, 2], orientation: :north, instructions: [] }
    end

    test "should move forward robot when face west" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1], orientation: :west, instructions: [:move] }) == %{position: [0, 1], orientation: :west, instructions: [] }
    end

    test "should move forward robot when face east" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1], orientation: :east, instructions: [:move] }) == %{position: [2, 1], orientation: :east, instructions: [] }
    end
  end

  describe "display report" do
    test "should display report" do
      assert RobotSimulator.execute_instruction(%{position: [2, 3], orientation: :east, instructions: [:report] }) == [2,3, :east]
    end
  end

  describe "move the robot and display its position" do
    test "should run first example" do
      assert RobotSimulator.run_robot("test/example.txt") == [0,1,:north]
    end

    test "should run second example" do
      assert RobotSimulator.run_robot("test/example_b.txt") == [0,0,:west]
    end

    test "should run third example" do
      assert RobotSimulator.run_robot("test/example_c.txt") == [3,3,:north]
    end
  end
end