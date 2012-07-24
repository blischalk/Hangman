class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :status
      t.integer :difficulty

      t.timestamps
    end
  end
end
