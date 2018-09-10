defmodule Flattener do
  @moduledoc """
  Flattener.flat will flatten an array of arbitrarily nested arrays of integers into a flat array of integers. e.g. [[1,2,[3]],4] -> [1,2,3,4]. 
  """

  @doc """
  Given neseted list return flattened list.

  ##Example
    iex> Flattener.flat [[1,2,[3]],4]
    [1,2,3,4]

    iex> Flattener.flat [1,[2,[3]],4]
    [1,2,3,4]

    iex> Flattener.flat [1,2,3,4]
    [1,2,3,4]

    iex> Flattener.flat [[1],2,[3]]
    [1,2,3]
  """

  def flat(list) when is_list(list) do
    do_flat(list, [])
  end

  defp do_flat([h|t], tail) when is_list(h) do
    do_flat(h, do_flat(t, tail))
  end

  defp do_flat([h|t], tail) do
    [h|do_flat(t, tail)]
  end

  defp do_flat([], tail) do 
    tail
  end
end
