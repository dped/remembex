class CreateGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.references :text_paragraph, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :number_of_inputs
      t.integer :number_of_attempts

      t.timestamps
    end
  end
end
