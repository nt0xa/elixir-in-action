defmodule TailFunctionCalls do
  def list_len(l) do
    do_list_len(0, l)
  end

  defp do_list_len(len, []) do
    len
  end

  defp do_list_len(len, [_ | tail]) do
    do_list_len(len + 1, tail)
  end

  def range(a, b) when a <= b do
    do_range([], a, b)
  end

  def range(_, _) do
    {:error, "invalid range"}
  end

  defp do_range(r, b, b) do
    r
  end

  defp do_range(r, a, b) do
    do_range([b - 1 | r], a, b - 1)
  end

  def positive(l) do
    do_positive([], l)
  end

  defp do_positive(p, []) do
    Enum.reverse(p)
  end

  defp do_positive(p, [head | tail]) when head > 0 do
    do_positive([head | p], tail)
  end

  defp do_positive(p, [_ | tail]) do
    do_positive(p, tail)
  end
end
