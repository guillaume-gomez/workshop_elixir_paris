defmodule RomanNumerals do
  @doc """
  Converts an Arabic numeral into a Roman numeral
  """
  def convert(str) , do: convert_array(String.graphemes(str))
  def convert_array(["M"| rest]) , do: convert_array(rest) + 1000
  def convert_array(["D"| rest]) , do: convert_array(rest) + 500
  def convert_array(["C"| rest]) , do: convert_array(rest) + 100
  def convert_array(["L"| rest]) , do: convert_array(rest) + 50
  def convert_array(["X"| rest]) , do: convert_array(rest) + 10
  def convert_array(["I", "X"| rest]) , do: convert_array(rest) + 9
  def convert_array(["V"| rest]) , do: convert_array(rest) + 5
  def convert_array(["I", "V"| rest]) , do: convert_array(rest) + 4
  def convert_array(["I"| rest]) , do: convert_array(rest) + 1
  def convert_array([]) , do: 0

end
