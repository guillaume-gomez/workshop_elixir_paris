defmodule RobotSimulator do
  @moduledoc """
  Documentation for `RobotSimulator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RobotSimulator.hello()
      :world

  """
  def hello do
    :world
  end

  def read_input(path) do
    File.read!(path)
    |> String.split("\n")
    |> parse_string()
  end

  defp parse_string(["PLACE " <> args | instructions]) do
    [x, y, orientation] = String.split(args, ",")
    %{
      position: [String.to_integer(x), String.to_integer(y)],
      orientation: convert_to_atom(orientation),
      instructions: parse_instructions(instructions)
    }
  end

  def parse_instructions(instructions) do
    Enum.map(instructions, fn x -> instruction(x) end)
  end

  defp convert_to_atom("NORTH"), do: :north
  defp convert_to_atom("SOUTH"), do: :south
  defp convert_to_atom("WEST"), do: :west
  defp convert_to_atom("EAST"), do: :east

  defp instruction("MOVE"), do: :move
  defp instruction("REPORT"), do: :report
  defp instruction("LEFT"), do: :left
  defp instruction("RIGHT"), do: :right

  def execute_instructions(instructions) do
    
  end

  # north
  def execute_instruction(%{position: position, orientation: :north, instructions: [:left | commands] }) do
    %{position: position, orientation: :west, instructions: commands }
  end

  def execute_instruction(%{position: position, orientation: :north, instructions: [:right | commands] }) do
    %{position: position, orientation: :east, instructions: commands }
  end
  # west
  def execute_instruction(%{position: position, orientation: :west, instructions: [:left | commands] }) do
    %{position: position, orientation: :south, instructions: commands }
  end

  def execute_instruction(%{position: position, orientation: :west, instructions: [:right | commands] }) do
    %{position: position, orientation: :north, instructions: commands }
  end
  # south
  def execute_instruction(%{position: position, orientation: :south, instructions: [:left | commands] }) do
    %{position: position, orientation: :east, instructions: commands }
  end

  def execute_instruction(%{position: position, orientation: :south, instructions: [:right | commands] }) do
    %{position: position, orientation: :west, instructions: commands }
  end

  # east
  def execute_instruction(%{position: position, orientation: :east, instructions: [:left | commands] }) do
    %{position: position, orientation: :north, instructions: commands }
  end

  def execute_instruction(%{position: position, orientation: :east, instructions: [:right | commands] }) do
    %{position: position, orientation: :south, instructions: commands }
  end

  # move north
  def execute_instruction(%{position: [x, y], orientation: :north, instructions: [:move | commands] }) do
    %{position: [x, y + 1], orientation: :north, instructions: commands }
  end

  # move south
  def execute_instruction(%{position: [x, y], orientation: :south, instructions: [:move | commands] }) do
    %{position: [x, y - 1], orientation: :south, instructions: commands }
  end

  # move west
  def execute_instruction(%{position: [x, y], orientation: :west, instructions: [:move | commands] }) do
    %{position: [x - 1, y], orientation: :west, instructions: commands }
  end

  # move east
  def execute_instruction(%{position: [x, y], orientation: :east, instructions: [:move | commands] }) do
    %{position: [x + 1, y], orientation: :east, instructions: commands }
  end

  # error clause
  def execute_instruction(%{position: position, orientation: orientation, instructions: [:move | commands] }) do
    %{position: position, orientation: :orientation, instructions: commands }
  end

end
