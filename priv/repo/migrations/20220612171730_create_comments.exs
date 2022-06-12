defmodule GayaneLibrary.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :text_content, :text, null: false, default: ""
      add :user_id, references(:users)
      add :book_id, references(:books)

      timestamps()
    end
  end
end
