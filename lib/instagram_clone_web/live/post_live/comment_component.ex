defmodule InstagramCloneWeb.PostLive.CommentComponent do
  use InstagramCloneWeb, :live_component

  alias InstagramClone.Uploaders.Avatar

  defp component_id(comment) do
    "comment-#{comment.id}"
  end
end
