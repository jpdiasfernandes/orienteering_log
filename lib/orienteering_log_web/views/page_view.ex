defmodule OrienteeringLogWeb.PageView do
  use OrienteeringLogWeb, :view
  alias OrienteeringLog.Logs

  def someLogs() do
    list = Logs.list_logs()
    list = Enum.sort_by(list, &(&1.date), Date)
    Enum.take(list, 5)
  end
end
