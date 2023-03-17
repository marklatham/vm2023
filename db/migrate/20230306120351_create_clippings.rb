class CreateClippings < ActiveRecord::Migration[7.0]
  def change
    create_table :clippings do |t|
      t.date :date_sequence
      t.string :date_text
      t.string :source
      t.string :source_url
      t.string :author
      t.string :title
      t.string :title_url
      t.text :description

      t.timestamps
    end
  end
end
