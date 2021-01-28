defmodule OrienteeringLog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OrienteeringLog.Repo,
      # Start the Telemetry supervisor
      OrienteeringLogWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OrienteeringLog.PubSub},
      # Start the Endpoint (http/https)
      OrienteeringLogWeb.Endpoint
      # Start a worker by calling: OrienteeringLog.Worker.start_link(arg)
      # {OrienteeringLog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OrienteeringLog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OrienteeringLogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
