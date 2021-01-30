defmodule OrienteeringLogWeb.LogView do
  use OrienteeringLogWeb, :view
  alias OrienteeringLogWeb.LogController

  #Recieves the time data and gives the minutes/km pace.
  def min_km(time, distance) do
    secs = time.hour * 3600 + time.minute * 60 + time.second
    secs_k = secs/distance
    min_k = secs_k/60
    secs_k = (min_k - floor(min_k)) * 60

    {floor(min_k), floor(secs_k)}

  end

  def km_last_days(interval) do
    LogController.km_interval(Date.utc_today(), interval)
  end


end
