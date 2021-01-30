defmodule OrienteeringLogWeb.PageView do
  use OrienteeringLogWeb, :view
  alias OrienteeringLogWeb.LogController

  def last_logs(interval) do
    LogController.logs_from_interval(interval)
  end

  def km_last_days(interval) do
    LogController.km_interval(Date.utc_today(), interval)
  end

end
