defmodule Exmeal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Exmeal.Repo,
      # Start the Telemetry supervisor
      ExmealWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Exmeal.PubSub},
      # Start the Endpoint (http/https)
      ExmealWeb.Endpoint
      # Start a worker by calling: Exmeal.Worker.start_link(arg)
      # {Exmeal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exmeal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # coveralls-ignore-start
  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ExmealWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  # coveralls-ignore-stop
end
