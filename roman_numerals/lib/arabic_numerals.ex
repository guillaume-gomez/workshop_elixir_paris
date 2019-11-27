defmodule ArabicNumerals do
  @doc """
  Converts a Roman numeral into  an Arabic numeral
  """
  def convert(1), do: "I"
  def convert(4), do: "IV"
  def convert(5), do: "V"
  def convert(9), do: "IX"
  def convert(10), do: "X"
  def convert(50), do: "L"
  def convert(100), do: "C"
  def convert(500), do: "D"
  def convert(1000), do: "M"

  def convert(number) do
      
  end
end
