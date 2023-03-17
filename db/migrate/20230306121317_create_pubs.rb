class CreatePubs < ActiveRecord::Migration[7.0]
  def change
    create_table :pubs do |t|
      t.date :date
      t.string :title
      t.float :pages
      t.integer :stars, default: 1
      t.string :country
      t.string :description

      t.timestamps
    end
  end
end
