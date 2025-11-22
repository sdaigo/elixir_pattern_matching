# ---
# Excerpted from "Thinking Elixir - PatternMatching", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/pattern-matching/ for course
# information.
# ---
defmodule PatternMatching.Structs do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias PatternMatching.{Customer, User}

  def get_name(%{name: name}), do: {:ok, name}
  def get_name(_), do: {:error, "Doesn't have a name"}

  def create_greeting(%{active: false}), do: {:error, "Recipient is inactive"}

  def create_greeting(%User{active: true, name: name}) do
    {:ok, "Greetings user #{name}!"}
  end

  def create_greeting(%Customer{active: true, name: name}) do
    {:ok, "Howdy customer #{name}!"}
  end

  def deactivate_user(%User{} = user) do
    {:ok, %{user | active: false}}
  end

  def deactivate_user(_), do: {:error, "Not a User"}
end
