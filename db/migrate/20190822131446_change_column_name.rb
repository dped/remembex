class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_sessions, :number_of_attempts, :number_of_right_inputs
  end
end
