defmodule InstagramCloneWeb.ModalComponent do
  use InstagramCloneWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id="#{@id}-hoge"
      class="fixed top-0 left-0 flex items-center justify-center w-full h-screen bg-black bg-opacity-40 z-50"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target={@myself}
      phx-page-loading>

      <div class={modal_classes(@width)}>
        <%= live_patch raw("&times;"), to: @return_to, class: "float-right text-gray-500 text-4xl px-4" %>
        <.live_component {modal_component_attrs(@component, @opts)} />
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end

  defp modal_classes(width) do
    "#{width} h-auto bg-white rounded-xl shadow-xl"
  end

  defp modal_component_attrs(module, opts) do
    opts
    |> Keyword.put_new(:module, module)
  end
end
