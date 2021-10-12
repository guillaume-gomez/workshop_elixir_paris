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
  defp instruction("UP"), do: :up
  defp instruction("DOWN"), do: :down

end
