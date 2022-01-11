defmodule InstagramCloneWeb.LiveHelpers do
  import Phoenix.LiveView
  alias InstagramClone.Accounts
  alias InstagramClone.Accounts.User
  alias InstagramCloneWeb.UserAuth

  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `LiveviewPlaygroundWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.
  The rendered modal also receives a `:width` option for the style width

  ## Examples

      <%= live_modal @socket, LiveviewPlaygroundWeb.PostLive.FormComponent,
        id: @post.id || :new,
        width: "w-1/2",
        post: @post,
        return_to: Routes.post_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    width = Keyword.fetch!(opts,  :width)
    modal_opts = [id: :modal, return_to: path, width: width, component: component, opts: opts]
    live_component(socket, InstagramCloneWeb.ModalComponent, modal_opts)
  end

  def assign_defaults(session, socket) do
    if connected?(socket), do: InstagramCloneWeb.Endpoint.subscribe(UserAuth.pubsub_topic())

    socket =
      assign_new(socket, :current_user, fn ->
        find_current_user(session)
      end)

    socket
  end

  defp find_current_user(session) do
    with user_token when not is_nil(user_token) <- session["user_token"],
         %User{} = user <- Accounts.get_user_by_session_token(user_token),
         do: user
  end
end
