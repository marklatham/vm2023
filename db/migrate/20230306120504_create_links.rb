class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
