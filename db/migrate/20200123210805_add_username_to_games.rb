class AddUsernameToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :username, :string
  end
end
