# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Recursion do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """

  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.Customer
  alias CodeFlow.Schemas.OrderItem

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total(order_items) do
    aux_order_total(order_items, 0)
  end

  defp aux_order_total([%OrderItem{} = order_item | tail], acc) do
    aux_order_total(tail, acc + order_item.item.price * order_item.quantity)
  end

  defp aux_order_total([], acc), do: acc

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  def count_active(customers) do
    aux_count_active(customers, 0)
  end

  defp aux_count_active([%Customer{active: true} | rest], acc) do
    aux_count_active(rest, acc + 1)
  end

  defp aux_count_active([_ | rest], acc) do
    aux_count_active(rest, acc)
  end

  defp aux_count_active([], acc), do: acc

  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(total) do
    aux_create_customers(total, 0)
  end

  defp aux_create_customers(total, num) when num < total do
    {:ok, _new_customer} = Customers.create(%{name: "Customer #{num}"})
    aux_create_customers(total, num + 1)
  end

  defp aux_create_customers(total, _num) do
    "Created #{total} customers!"
  end

  @doc """
  Compute the value in the Fibonacci sequence for the number. If the number is
  "10", then the result is 10 plus the value of the 9th index of the fibonacci
  sequence.
  https://en.wikipedia.org/wiki/Fibonacci_number
  """
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1

  def fibonacci(num) do
    fibonacci(num - 2) + fibonacci(num - 1)
  end
end
