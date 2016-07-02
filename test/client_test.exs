defmodule Spotify.ClientTest do
  use ExUnit.Case
  import Spotify.Client

  doctest Spotify.Client

  test "default endpoint" do
    client = new()
    assert client.endpoint == "https://api.spotify.com/"
  end

  test "custom auth" do
    client = new(%{"access_token" => "123"})
    assert client.auth == %{"access_token" => "123"}
  end

  test "custom endpoint" do
    expected = "https://some.url.com/v2/"

    client = new(%{}, "https://some.url.com/v2/")
    assert client.endpoint == expected

    client = new(%{}, "https://some.url.com/v2")
    assert client.endpoint == expected
  end
end
