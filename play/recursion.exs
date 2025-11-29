defmodule Play.Recursion do
  def process([head | rest]) do
    IO.puts("Value of num  = #{head}")
    process(rest)
  end

  def process([]), do: IO.puts("Done!")

  def sum([head | tail], acc) do
    sum(tail, acc + head)
  end

  def sum([], acc), do: acc

  def build_text(number) do
    aux_build_text(number, 0, "")
  end

  defp aux_build_text(total, num, text) when num < total do
    aux_build_text(
      total,
      num + 1,
      text <> "Processed number #{num}\n"
    )
  end

  defp aux_build_text(_total, _num, text), do: text
end

data = [1, 2, 3, 4, 5]
data |> Play.Recursion.process()

sum_result = data |> Play.Recursion.sum(0)
"Sum of numbers = #{sum_result}" |> IO.puts()

text = Play.Recursion.build_text(5)
text |> IO.puts()
