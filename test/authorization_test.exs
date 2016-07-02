defmodule SpotifyAuthorizationTest do
  use ExUnit.Case
  import Spotify.Authorization

  doctest Spotify.Authorization

  test "#call with scopes" do
    Application.put_env(:spotify_ex, :scopes, ["foo", "bar"])
    assert(call == "https://accounts.spotify.com/authorize?client_id=#{Spotify.client_id}&response_type=code&redirect_uri=#{Spotify.callback_url}&scope=foo%20bar")
  end

  test "#call without scopes" do
    Application.put_env(:spotify_ex, :scopes, [])

    assert(call == "https://accounts.spotify.com/authorize?client_id=#{Spotify.client_id}&response_type=code&redirect_uri=#{Spotify.callback_url}")
  end
end
