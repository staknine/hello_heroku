defmodule HelloHeroku.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HelloHeroku.Repo,
      # Start the Telemetry supervisor
      HelloHerokuWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloHeroku.PubSub},
      # Start the Endpoint (http/https)
      HelloHerokuWeb.Endpoint
      # Start a worker by calling: HelloHeroku.Worker.start_link(arg)
      # {HelloHeroku.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloHeroku.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelloHerokuWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
