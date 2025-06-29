defmodule Streams do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&(String.trim_trailing(&1) |> String.length()))
    |> Enum.to_list()
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.length/1)
    |> Enum.max()
  end

  def longest_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&({String.length(&1), &1}))
    |> Enum.max_by(&(elem(&1, 0)))
    |> elem(1)
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.split/1)
    |> Stream.map(&length/1)
    |> Enum.to_list()
  end
end
