defmodule GayaneLibrary.Repo.Migrations.CreateCommentLikes do
  use Ecto.Migration

  def change do
    create table(:comment_likes) do
      add :comment_id, references(:comments)
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:comment_likes, [:comment_id, :user_id])
  end
end
