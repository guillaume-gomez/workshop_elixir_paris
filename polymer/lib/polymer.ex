defmodule Polymer do
  @doc """
  Step 1
  """
  def combination_after_reactions(str) do
    combine(String.first(str), String.last(str))
  end


  def combine(a, a)do
    a <> a
  end

  def combine(a, b) do
    cond do
      String.upcase(a) == String.upcase(b) ->
        ""
      true ->
        a <> b
    end
  end



  @doc """
  Step 2
  """
  def combination_after_optimization_and_reactions(combination) do
  end
end
