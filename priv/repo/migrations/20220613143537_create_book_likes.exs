defmodule GayaneLibrary.Repo.Migrations.CreateBookLikes do
  use Ecto.Migration

  def change do
    create table(:book_likes) do
      add :book_id, references(:books)
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:book_likes, [:book_id, :user_id])
  end
end
