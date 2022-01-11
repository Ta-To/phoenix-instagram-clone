defmodule InstagramCloneWeb.UserLive.Profile do
  use InstagramCloneWeb, :live_view

  @impl true
  def mount(%{"username" => username}, session, socket) do
    socket = assign_defaults(session, socket)

    {:ok,
      socket
      |> assign(username: username)}
  end
end
