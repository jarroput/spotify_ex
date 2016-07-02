defmodule Spotify.Mixfile do
  use Mix.Project

  def project do
    [app: :spotify_ex,
     version: "0.0.3",
     elixir: "~> 1.1",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  defp package do
    [
      maintainers: ["Jason Cummings"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://www.github.com/jsncmgs1/spotify_ex",
               "Example Phoenix App" => "https://www.github.com/jsncmgs1/spotify_ex_test"}
    ]
  end
  defp description do
    """
    An Elixir wrapper for Spotify API.
    """
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 1.5"}
    ]
  end
end
