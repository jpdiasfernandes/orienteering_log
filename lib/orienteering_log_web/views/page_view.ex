defmodule OrienteeringLogWeb.PageView do
  use OrienteeringLogWeb, :view
  alias OrienteeringLogWeb.LogController

  def last_logs(interval) do
    list = LogController.get_list_logs()
    len = Enum.count(list)

    if (interval > len) do interval = len end

    Enum.sort_by(list, &(&1.date), Date)
    |>Enum.take(-interval)

  end

  def km_interval(interval) do
    cmp = Date.add(Date.utc_today(), interval)
    LogController.get_list_logs()
    |> Enum.filter(fn x -> Date.diff(x.date, cmp) > 0 end)
    |> Enum.map(&(&1.distance))
    |> Enum.sum()
  end

end
