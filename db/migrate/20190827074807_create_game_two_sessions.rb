class CreateGameTwoSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_two_sessions do |t|
      t.integer :number_of_inputs
      t.integer :number_of_right_inputs
      t.references :text_paragraph, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
