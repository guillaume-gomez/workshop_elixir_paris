defmodule RobotSimulatorTest do
  use ExUnit.Case
  doctest RobotSimulator

  test "greets the world" do
    assert RobotSimulator.hello() == :world
  end

  describe "parsing file" do
    test "should read the basic example" do
      assert RobotSimulator.read_input("test/example.txt") == %{ position: [0, 0, :north], instructions: [:move, :report] }
    end
    
    test "should read the second example" do
      assert RobotSimulator.read_input("test/example_b.txt") == %{ position: [0, 0, :north], instructions: [:left, :report] }
    end

    test "should read the third example" do
      assert RobotSimulator.read_input("test/example_c.txt") == %{ position: [1, 2, :east], instructions: [:move, :move, :left, :move, :report] }
    end

    test "should avoid invalid PLACE instruction" do
      assert RobotSimulator.read_input("test/example_e.txt") == %{ position: [1, 2, :south], instructions: [:move, :move, :move, :report] }
    end
  end

  describe "move robot" do
    test "should rotate robot to the left when face north" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :north], instructions: [:left] }) == %{position: [0, 0, :west], instructions: [] }
    end

    test "should rotate robot to the right when face north" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :north], instructions: [:right] }) == %{position: [0, 0, :east], instructions: [] }
    end

    test "should rotate robot to the left when face west" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :west], instructions: [:left] }) == %{position: [0, 0, :south], instructions: [] }
    end

    test "should rotate robot to the right when face west" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :west], instructions: [:right] }) == %{position: [0, 0, :north], instructions: [] }
    end

    test "should rotate robot to the left when face east" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :east], instructions: [:left] }) == %{position: [0, 0, :north], instructions: [] }
    end

    test "should rotate robot to the right when face east" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :east], instructions: [:right] }) == %{position: [0, 0, :south], instructions: [] }
    end

    test "should rotate robot to the left when face south" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :south], instructions: [:left] }) == %{position: [0, 0, :east], instructions: [] }
    end

    test "should rotate robot to the right when face south" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :south], instructions: [:right] }) == %{position: [0, 0, :west], instructions: [] }
    end

    test "should move forward robot when face south" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1, :south], instructions: [:move] }) == %{position: [1, 0, :south], instructions: [] }
    end

    test "should NOT move forward robot when face south" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :south], instructions: [:move] }) == %{position: [0, 0, :south], instructions: [] }
    end

    test "should move forward robot when face north" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1, :north], instructions: [:move] }) == %{position: [1, 2, :north], instructions: [] }
    end

    test "should NOT move forward robot when face north" do
      assert RobotSimulator.execute_instruction(%{position: [0, 4, :north], instructions: [:move] }) == %{position: [0, 4, :north], instructions: [] }
    end

    test "should move forward robot when face west" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1, :west], instructions: [:move] }) == %{position: [0, 1, :west], instructions: [] }
    end

    test "should NOT move forward robot when face west" do
      assert RobotSimulator.execute_instruction(%{position: [0, 0, :west], instructions: [:move] }) == %{position: [0, 0, :west], instructions: [] }
    end

    test "should move forward robot when face east" do
      assert RobotSimulator.execute_instruction(%{position: [1, 1, :east], instructions: [:move] }) == %{position: [2, 1, :east], instructions: [] }
    end

    test "should NOT move forward robot when face east" do
      assert RobotSimulator.execute_instruction(%{position: [4, 0, :east], instructions: [:move] }) == %{position: [4, 0, :east], instructions: [] }
    end
  end

  describe "display report" do
    test "should display report" do
      assert RobotSimulator.execute_instruction(%{position: [2, 3, :east], instructions: [:report] }) == %{instructions: [], position: [2, 3, :east]}
    end
  end

  describe "move the robot and display its position" do
    test "should run first example" do
      assert RobotSimulator.run_robot("test/example.txt") == [[0,1,:north]]
    end

    test "should run second example" do
      assert RobotSimulator.run_robot("test/example_b.txt") == [[0,0,:west]]
    end

    test "should run third example" do
      assert RobotSimulator.run_robot("test/example_c.txt") == [[3,3,:north]]
    end

    test "should run fouth example" do
      assert RobotSimulator.run_robot("test/example_d.txt") == [[0,0,:north], [0,1,:north]]
    end

    test "should run fifth example" do
      assert RobotSimulator.run_robot("test/example_e.txt") == [[1,0,:south]]
    end
  end
end