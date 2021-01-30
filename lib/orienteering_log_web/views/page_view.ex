defmodule OrienteeringLogWeb.PageView do
  use OrienteeringLogWeb, :view
  alias OrienteeringLogWeb.LogController

  def last_logs(interval) do
    LogController.logs_from_interval(interval)
  end
end
