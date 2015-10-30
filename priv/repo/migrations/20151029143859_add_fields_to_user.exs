defmodule OpenfnIx.Repo.Migrations.AddFieldsToUser do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		add :hashed_password, :string
  		add :hashed_confirmation_token, :string
  		add :confirmed_at, :datetime
  		add :hashed_password_reset_token, :string
  		add :unconfirmed_email, :string
  		add :authentication_tokens, {:array, :string}, default: []

  	end
  end
end
