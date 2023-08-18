defmodule Exmeal.Meals.Delete do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> Error.build(:not_found, "Meal not found")
      meal -> Repo.delete(meal)
    end
  end
end
