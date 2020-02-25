defmodule Polymer do
  @doc """
  Step 1
  """
  def combination_after_reactions(str) do
    [a, b] = String.to_char_list(str)
    combine(a, b)
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

  def iterate([a |[ b | tail] ] ) do
     combine(a, b) <> iterate([b, tail])
  end

  def iterate([a| b]) do
    ""
  end

  @doc """
  Step 2
  """
  def combination_after_optimization_and_reactions(combination) do
  end
end
