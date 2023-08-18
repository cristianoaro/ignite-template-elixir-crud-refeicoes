defmodule Exmeal.Meals.Update do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> Error.build(:not_found, "Meal not found")
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
