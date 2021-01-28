defmodule OrienteeringLog.Logs.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :body, :string, default: "-"
    field :distance, :float, default: 0
    field :effort, :integer, default: 0
    field :elevation, :integer, default: 0
    field :time, :time
    field :title, :string
    field :date, :date
    field :avg_hr, :integer, default: 0
    field :max_hr, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:title, :body, :distance, :time, :elevation, :effort, :date, :avg_hr, :max_hr])
    |> validate_required([:title,:distance, :time, :date])
  end
end
