defmodule Elastack.Server do
  @moduledoc """
  Server part of elastack
  """

  use GenServer
  alias Elastack.Impl

  def init(initial_list) do
    {:ok, initial_list}
  end

  def handle_call(:pop, _from, current_list) do
    {head, new_current_list} = Impl.pop(current_list)
    {:reply, head, new_current_list}
  end

  def handle_cast({:push, item}, current_list) do
    {:noreply, Impl.push(current_list, item)}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect(state)}', and I'm happy"}]]
  end

  def terminate(reason, state) do
    IO.puts("Reason: #{reason}, State: #{state}")
  end
end
