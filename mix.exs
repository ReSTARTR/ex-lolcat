defmodule Lolcat.Mixfile do
  use Mix.Project

  def project do
    [app: :lolcat,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: escript_config,

     description: description,
     package: package,

     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:quickrand, tag: "1.5.0" },
      {:colorful,  tag: "0.6.0" }
    ]
  end

  defp description do
    """
    """
  end

  defp package do
    [contributors: ["Masaki YOSHIDA"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/restartr/ex-lolcat"}
    ]
  end

  defp escript_config do
    [ main_module: Lolcat ]
  end
end
