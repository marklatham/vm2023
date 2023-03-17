class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title, :default => ""
      t.text :description
      t.string :tags, :default => ""
      t.string :category, :default => ""
      t.string :url, :default => ""
      t.text :transcript

      t.timestamps
    end
  end
end
