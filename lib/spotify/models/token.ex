defmodule Spotify.Models.Token do
  defstruct access_token: nil,
            token_type: nil,
            scope: nil,
            expires_in: nil,
            refresh_token: nil

end
