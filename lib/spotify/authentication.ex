defmodule Spotify.Authentication do
  use HTTPoison.Base
  alias Spotify.Models.Token

  @endpoint "https://accounts.spotify.com/api/token"

  def call(code) do
    case request(:post, @endpoint, authenticate_body_params(code), Spotify.headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode(body, as: %Token{})
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        { 404, "Not found :(" }
      {:error, %HTTPoison.Error{reason: reason}} ->
        { 500, reason }
    end
  end

  def refresh(refresh_token) do
    case request(:post, @endpoint, refresh_body_params(refresh_token), Spotify.headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode(body, as: %Token{})
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {404, "Not found :(" }
    end
  end

  defp refresh_body_params(refresh_token) do
    "grant_type=refresh_token&refresh_token=#{refresh_token}"
  end

  defp authenticate_body_params(code) do
    "grant_type=authorization_code&code=#{code}&redirect_uri=#{Spotify.callback_url}"
  end
end
