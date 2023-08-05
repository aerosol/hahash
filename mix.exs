defmodule Hahash.MixProject do
  use Mix.Project

  def project do
    [
      app: :hahash,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps() do
    []
  end

  def package() do
    [
      name: "hahash",
      description: "Hash terms into cute names",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/aerosol/hahash"}
    ]
  end
end
