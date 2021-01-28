defmodule OrienteeringLog.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :title, :string
      add :body, :text, default: "-"
      add :distance, :float, default: 0
      add :time, :time
      add :elevation, :integer, default: 0
      add :effort, :integer, default: 0
      add :date, :date
      add :avg_hr, :integer, default: -1
      add :max_hr, :integer, default: -1

      timestamps()
    end

  end
end
