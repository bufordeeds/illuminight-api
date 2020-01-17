class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :clicks
      t.integer :time
      t.integer :score
      t.integer :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
