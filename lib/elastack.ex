defmodule Elastack do
  @moduledoc """
  Documentation for `Elastack`.
  """

  @server Elastack.Server

  use Agent

  @doc """
  Create new stack server by providing initial initial list.

  ## Examples

      iex> Elastack.hello()
      :world

  """
  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def push(item) do
    GenServer.cast(@server, {:push, item})
  end
end
