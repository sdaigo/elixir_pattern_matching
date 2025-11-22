defmodule PatternMatching.Lists do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """

  def is_empty?([]), do: true
  def is_empty?(_), do: false

  def has_1_item?([_]), do: true
  def has_1_item?(_), do: false

  def at_least_one?([_ | _rest]), do: true
  def at_least_one?(_), do: false

  def return_first_item([h | _]), do: h
  def return_first_item(_), do: :error

  def starts_with_1?([1 | _rest]), do: true
  def starts_with_1?(_), do: false

  def sum_pair([a, b]), do: a + b
  def sum_pair(_), do: :error

  def sum_first_2([a, b | rest]), do: [a + b | rest]
  def sum_first_2(list), do: list
end
