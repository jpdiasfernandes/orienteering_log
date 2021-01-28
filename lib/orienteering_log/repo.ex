defmodule OrienteeringLog.Repo do
  use Ecto.Repo,
    otp_app: :orienteering_log,
    adapter: Ecto.Adapters.Postgres
end
