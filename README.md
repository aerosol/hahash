# Hahash

Hash Erlang terms into cute names.

I'm not sure if all end up cute. Don't use for anything very serious, just in case.

## Usage

```elixir
iex(1)> Hahash.name self()
"man-bisque-duffel"
iex(2)> Hahash.name true
"automate-relaxed-range"
iex(3)> Hahash.name false
"stagger-symmetric-decision"
iex(4)> Hahash.name 0
"relieve-quick-change"
iex(5)> Hahash.name &Enum.random/1
"board-soft-limburger"
```

## Distribution

While the hashing is consistent and portable (it relies on [phash2](https://www.erlang.org/doc/man/erlang.html#phash2-2)), 
the range is pretty small. You should not rely on it, if the hash unicity is critical.

```elixir
iex(1)> 1..1_000_000 |> Enum.map(fn x -> Hahash.name(x) end) |> Enum.uniq() |> Enum.count()

996785
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hahash` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hahash, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hahash>.

