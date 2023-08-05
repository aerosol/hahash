defmodule Hahash do
  @moduledoc """
  Hash any term into a cute name.
  """
  use Hahash.Wordlist

  @spec name(any()) :: String.t()
  @doc """
  Proivide any term (atom, map, whatever), get a name back.
  The names consist of verb, adjective and a noun, separated
  with hyphen.
  """
  def name(term) do
    verb_index = :erlang.phash2(term, verbs_size())
    adjective_index = :erlang.phash2(term, adjectives_size())
    noun_index = :erlang.phash2(term, nouns_size())

    "#{verbs(verb_index)}-#{adjectives(adjective_index)}-#{nouns(noun_index)}"
  end
end
