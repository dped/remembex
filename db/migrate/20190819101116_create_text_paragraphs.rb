class CreateTextParagraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :text_paragraphs do |t|
      t.references :full_text, foreign_key: true
      t.text :content
      t.integer :order_number
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
