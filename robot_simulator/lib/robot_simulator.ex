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
    [x_int, y_int] = [String.to_integer(x), String.to_integer(y)]
    case check_valid_place(x_int, y_int) do
      false ->
        parse_string(instructions)
      _ ->
        %{
          position: [x_int, y_int, convert_to_atom(orientation)],
          instructions: parse_instructions(instructions)
        }
    end
  end

  defp parse_string([_no_place_instruction | instructions]) do
    parse_string(instructions)
  end

  def check_valid_place(x, _y) when x < 0 or x > 4, do: false
  def check_valid_place(_x, y) when y < 0 or y > 4, do: false
  def check_valid_place(_x, _y), do: true


  defp parse_instructions(instructions) do
    Enum.map(instructions, fn x -> instruction(x) end)
  end

  def run_robot(path) do
    read_input(path)
    |> execute_instructions([])
  end

  defp convert_to_atom("NORTH"), do: :north
  defp convert_to_atom("SOUTH"), do: :south
  defp convert_to_atom("WEST"), do: :west
  defp convert_to_atom("EAST"), do: :east

  defp instruction("MOVE"), do: :move
  defp instruction("REPORT"), do: :report
  defp instruction("LEFT"), do: :left
  defp instruction("RIGHT"), do: :right

  def execute_instructions(%{position: position, instructions: [ :report| rest] }, output) do
    result_intruction = execute_instruction(%{position: position, instructions: [ :report| rest] })

    execute_instructions(result_intruction, [position | output])
  end

  def execute_instructions(%{position: _position, instructions: [] }, output) do
    Enum.reverse(output)
  end

  def execute_instructions(data, output) do
    result_intruction = execute_instruction(data)
    execute_instructions(result_intruction, output)
  end


  # north
  def execute_instruction(%{position: [x, y, :north], instructions: [:left | commands] }) do
    %{position: [x, y, :west], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :north], instructions: [:right | commands] }) do
    %{position: [x, y, :east], instructions: commands }
  end
  # west
  def execute_instruction(%{position: [x, y, :west], instructions: [:left | commands] }) do
    %{position: [x,y, :south], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :west], instructions: [:right | commands] }) do
    %{position: [x, y, :north], instructions: commands }
  end
  # south
  def execute_instruction(%{position: [x, y, :south], instructions: [:left | commands] }) do
    %{position: [x, y, :east], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :south], instructions: [:right | commands] }) do
    %{position: [x, y, :west], instructions: commands }
  end

  # east
  def execute_instruction(%{position: [x, y, :east], instructions: [:left | commands] }) do
    %{position: [x, y, :north], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :east], instructions: [:right | commands] }) do
    %{position: [x, y, :south], instructions: commands }
  end

  # move north
  def execute_instruction(%{position: [x, 4, :north], instructions: [:move | commands] }) do
    %{position: [x, 4, :north], instructions: commands }
  end
  
  def execute_instruction(%{position: [x, y, :north], instructions: [:move | commands] }) do
    %{position: [x, y + 1, :north], instructions: commands }
  end

  # move south
  def execute_instruction(%{position: [x, 0, :south], instructions: [:move | commands] }) do
    %{position: [x, 0,:south], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :south], instructions: [:move | commands] }) do
    %{position: [x, y - 1, :south], instructions: commands }
  end

  # move west
  def execute_instruction(%{position: [0, y, :west], instructions: [:move | commands] }) do
    %{position: [0, y, :west], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :west], instructions: [:move | commands] }) do
    %{position: [x - 1, y, :west], instructions: commands }
  end

  # move east
  def execute_instruction(%{position: [4, y, :east], instructions: [:move | commands] }) do
    %{position: [4, y, :east], instructions: commands }
  end

  def execute_instruction(%{position: [x, y, :east], instructions: [:move | commands] }) do
    %{position: [x + 1, y, :east], instructions: commands }
  end

  # report and error clause
  def execute_instruction(%{position: position, instructions: [_instruction | commands] }) do
    %{position: position, instructions: commands }
  end

end
