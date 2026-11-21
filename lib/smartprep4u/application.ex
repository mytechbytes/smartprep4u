defmodule SmartPrep4U.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SmartPrep4UWeb.Telemetry,
      SmartPrep4U.Repo,
      {DNSCluster, query: Application.get_env(:smartprep4u, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SmartPrep4U.PubSub},
      # Start a worker by calling: SmartPrep4U.Worker.start_link(arg)
      # {SmartPrep4U.Worker, arg},
      # Start to serve requests, typically the last entry
      SmartPrep4UWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SmartPrep4U.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SmartPrep4UWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
