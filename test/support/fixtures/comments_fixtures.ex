defmodule InstagramClone.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InstagramClone.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        total_likes: 42
      })
      |> InstagramClone.Comments.create_comment()

    comment
  end
end
