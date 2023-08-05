defmodule Hahash do
  use Hahash.Wordlist

  @spec name(any()) :: String.t()
  def name(term) do
    verb_index = :erlang.phash2(term, verbs_size())
    adjective_index = :erlang.phash2(term, adjectives_size())
    noun_index = :erlang.phash2(term, nouns_size())

    "#{verbs(verb_index)}-#{adjectives(adjective_index)}-#{nouns(noun_index)}"
  end
end
