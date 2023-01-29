defmodule Lvtwitter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LvtwitterWeb.Telemetry,
      # Start the Ecto repository
      Lvtwitter.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lvtwitter.PubSub},
      # Start Finch
      {Finch, name: Lvtwitter.Finch},
      # Start the Endpoint (http/https)
      LvtwitterWeb.Endpoint
      # Start a worker by calling: Lvtwitter.Worker.start_link(arg)
      # {Lvtwitter.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lvtwitter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LvtwitterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
