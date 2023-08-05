# Hahash

Hash Erlang terms into cute names.

I'm not sure if all end up cute. Don't use for anything very serious, just in case.

## Usage

```
iex(1)> Hahash.name(%{some: :term, foo: 1})
  "chat-other-driver"
iex(2)> Hahash.name(%{some: :term, foo: 2})
  "pluck-drab-property"
iex(3)> Hahash.name(true)
  "align-reduced-radar"
iex(4)> Hahash.name(false)
  "sprint-swarm-dataset"
iex(5)> Hahash.name(0)
  "reeve-proud-cash"
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

