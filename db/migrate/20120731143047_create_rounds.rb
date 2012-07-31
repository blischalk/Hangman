class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :phrase
      t.references :game
      t.timestamps
    end
  end
end
