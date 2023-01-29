defmodule Lvtwitter.Avatar do
  def generate(email) when is_binary(email) do
    avatar_client().generate(email)
  end

  defp avatar_client do
    Application.get_env(:lvtwitter, :avatar_client)
  end
end
