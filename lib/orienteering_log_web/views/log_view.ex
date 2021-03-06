defmodule OrienteeringLogWeb.LogView do
  use OrienteeringLogWeb, :view

  #Recieves the time data and gives the minutes/km pace.
  def min_km(time, distance) do
    secs = time.hour * 3600 + time.minute * 60 + time.second
    secs_k = secs/distance
    min_k = secs_k/60
    secs_k = (min_k - floor(min_k)) * 60

    {floor(min_k), floor(secs_k)}

  end


  def call_logs_inverse(logs) do
    logs
    |> Enum.sort_by(&(&1.date), Date)
    |> Enum.reverse()
  end

end
