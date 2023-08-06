defmodule Hahash do
  @moduledoc """
  Hash any term into a cute name.
  There is no guarantees all will end up cute nor very unique.

  Just in case, don't use it for anything very serious.
  I'm happy to remove words, if you feel like curating the list.
  """
  use Hahash.Wordlist

  @spec name(any()) :: String.t()
  @doc """
  Provide any term (atom, map, whatever), get a name back.

  The name is a string, consisting of a triple: 
  verb, adjective and a noun, separated with hyphen.
  """
  def name(term) do
    Enum.join(
      [
        term |> :erlang.phash2(verbs_size()) |> verbs(),
        term |> :erlang.phash2(adjectives_size()) |> adjectives(),
        term |> :erlang.phash2(nouns_size()) |> nouns()
      ],
      "-"
    )
  end
end
