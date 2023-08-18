defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meal) do
      add(:description, :string)
      add(:date, :date)
      add(:calories, :integer)
    end
  end
end
