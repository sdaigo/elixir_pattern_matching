data = [
  %{name: "Customer 1", total: 0},
  %{name: "Customer 2", total: 100},
  %{name: "Customer 3", total: 200}
]

result = data |> Enum.map(fn customer -> %{customer | total: customer.total + 50} end)
# result = data |> Enum.map(&%{&1 | total: &1.total + 50})
IO.inspect(result)

data = [1, 2, 3, 4, 5]
result = data |> Enum.reduce(0, &(&1 + &2))
IO.inspect(result)
