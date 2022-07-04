defmodule Elastack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(init_list) do
    GenServer.start_link(__MODULE__, init_list, name: @me)
  end

  @doc """
  Save the value in stash server.
  """
  def get() do
    GenServer.call(@me, {:get})
  end

  @doc """
  Get the stashed value an update the reproduced processes.
  """
  def update(new_list) do
    GenServer.cast(@me, {:update, new_list})
  end

  # Server impl

  def init(init_list) do
    {:ok, init_list}
  end

  def handle_call({:get}, _from, current_list) do
    {:reply, current_list, current_list}
  end

  def handle_cast({:update, new_list}, _current_number) do
    {:noreply, new_list}
  end
end
