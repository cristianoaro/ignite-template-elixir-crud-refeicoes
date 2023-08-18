defmodule Exmeal.Meals.Get do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> Error.build(:not_found, "Meal not found")
      meal -> {:ok, meal}
    end
  end
end
