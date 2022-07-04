defmodule Elastack.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Elastack, [123, "hello"]}
    ]

    opts = [strategy: :one_for_one, name: Elastack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
