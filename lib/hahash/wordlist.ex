defmodule Hahash.Wordlist do
  @moduledoc """
  Words. 

  Source material: https://github.com/imsky/wordlists

  Raw files are stored in `priv/` directory.
  """
  defmacro __using__(_opts) do
    quote do
      require Hahash.Wordlist
      import Hahash.Wordlist
    end
  end

  for category <- ["verbs", "adjectives", "nouns"] do
    path = Path.join([Application.app_dir(:hahash), "priv", "wordlists", category])
    {:ok, files} = Path.Wildcard.list_dir(path)

    words =
      Enum.reduce(files, [], fn f, acc ->
        words =
          path
          |> Path.join(f)
          |> File.read!()
          |> String.trim()
          |> String.split("\n")

        acc ++ words
      end)

    @doc """
    Returns the size of #{category} collection.
    Can be used in guards.
    """
    defmacro unquote(:"#{category}_size")() do
      quote bind_quoted: [size: unquote(length(words))] do
        size
      end
    end

    @doc """
    Given an index, greater or equal to 0,
    and less or equal than #{length(words) - 1},
    returns a word from '#{category}' category.
    """
    for {word, index} <- Enum.with_index(words) do
      def unquote(String.to_atom(category))(unquote(index)), do: unquote(word)
    end
  end
end
