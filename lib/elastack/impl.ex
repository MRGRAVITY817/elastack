defmodule Elastack.Impl do
  @moduledoc """
  Implementations of Elastack's business logics
  """

  def pop(current_list) do
    [head | new_current_list] = current_list
    {head, new_current_list}
  end

  def push(current_list, item) do
    [item | current_list]
  end
end
