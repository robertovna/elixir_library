defmodule GayaneLibrary.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :author, :string, default: ""
      add :name, :string, null: false
      add :text_content, :text
      add :year, :integer
      add :edition, :string, default: ""
      add :user_id, references(:users)

      timestamps()
    end
  end
end
