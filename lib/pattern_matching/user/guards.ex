defmodule PatternMatching.User.Guards do
  @moduledoc """
  Define guard clauses for working wiht Users.
  """

  @adult_age 18

  defguard is_adult?(age) when age >= @adult_age
  defguard is_minor?(age) when age > 0 and age < @adult_age
end
