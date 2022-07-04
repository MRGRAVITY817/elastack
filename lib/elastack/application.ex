defmodule Elastack.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Elastack.Stash, [123, "hello"]},
      {Elastack, nil}
    ]

    # `strategy:` defines how to revive processes when crashed
    # `:rest_for_one` will restart only the processes which has been
    # spawned after the crashed process.
    opts = [strategy: :rest_for_one, name: Elastack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
