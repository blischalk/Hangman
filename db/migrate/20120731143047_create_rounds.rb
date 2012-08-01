class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :phrase
      t.references :game
      t.text :phrase_indicies
      t.integer :incorrect_answers
      t.timestamps
    end
  end
end
