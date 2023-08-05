defmodule Hahash.Wordlist do
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

    defmacro unquote(:"#{category}_size")() do
      quote bind_quoted: [words: unquote(words)] do
        length(words)
      end
    end

    for {word, index} <- Enum.with_index(words, 1) do
      def unquote(String.to_atom(category))(unquote(index)), do: unquote(word)
    end
  end
end
