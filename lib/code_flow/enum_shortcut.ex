# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.EnumShortcut do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.Customer
  alias CodeFlow.Schemas.OrderItem

  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(0), do: :ok

  def create_customers(number) do
    Enum.each(1..number, fn num ->
      {:ok, _new_customer} = Customers.create(%{name: "Customer #{num}"})
    end)
  end

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total([]), do: 0

  def order_total(order_items) do
    # order_items |> Enum.reduce(0, &(&1.item.price * &1.quantity + &2))
    order_items
    |> Enum.reduce(0, fn %OrderItem{} = order_item, acc ->
      order_item.item.price * order_item.quantity + acc
    end)
  end

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  def count_active(customers) do
    # customers
    # |> Enum.reduce(0, fn
    #   %Customer{active: true}, acc -> acc + 1
    #   _, acc -> acc
    # end)
    Enum.reduce(customers, 0, &aux_count_active/2)
  end

  defp aux_count_active(%Customer{active: true}, acc), do: acc + 1
  defp aux_count_active(_customer, acc), do: acc
end
