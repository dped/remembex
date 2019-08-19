class CreateFullTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :full_texts do |t|
      t.string :title
      t.integer :percentage, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
