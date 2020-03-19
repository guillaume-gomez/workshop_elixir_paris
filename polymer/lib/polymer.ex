defmodule Polymer do
  @doc """
  Step 1
  """
  def combination_after_reactions(str) do
    charlist = String.to_charlist(str)
    IO.puts charlist
    iterate(charlist)
  end

  def combine(a, a) do
    List.to_string([a, a])
  end

  def combine(a, b) when a == b + 32 do
    ""
  end

  def combine(a, b) when a == b - 32 do
    ""
  end

  def combine(a,b) do
    List.to_string([a, b])
  end

  # todo add recursion to make chain reactions
  def iterate([a |[ b | tail] ] ) do
    IO.puts [b | tail]
    IO.puts combine(a, b)
    IO.puts "============"
    combine(a, b) <> iterate([b|tail])
  end

  def iterate([_a,_b]) do
    ""
  end

  def iterate([a]) do
    List.to_string([a])
  end

  def iterate([]) do
    ""
  end


  @doc """
  Step 2
  """
  def combination_after_optimization_and_reactions(_combination) do
  end
end


# solution 
#def combination_after_reactions(combination) do
#    combination |> String.to_char_list |> Enum.reduce([], fn 
#      c, [] ->[c]
#      c, [prev | rest] when c - prevc == ?A - &a -> rest
#      c, [prev | rest] when c - prevc == &a - &A -> rest
#      c, acc -> [c | acc]
#    end ) |> Enum.reserve |> IO.chardata_to_string
#  end


#def combination_after_optimization_and_reactions(combination) do
#  unquote(String.codepoints("abcdefghijklmnopqrstuvwxyz")) |> Enum.map(fn char ->
#    combination |> :binary.replace([char, String.upcase(char)], "", [:global])
#                |> combination_after_reactions()
#    end) |> Enum.sort_by(&String.length/1) |> List.first
#  end
#end