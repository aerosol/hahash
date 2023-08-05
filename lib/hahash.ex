defmodule Hahash do
  @moduledoc """
  Hash any term into a cute name.
  There is no guarantees all will end up cute.

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
    verb_index = :erlang.phash2(term, verbs_size())
    adjective_index = :erlang.phash2(term, adjectives_size())
    noun_index = :erlang.phash2(term, nouns_size())

    "#{verbs(verb_index)}-#{adjectives(adjective_index)}-#{nouns(noun_index)}"
  end
end
