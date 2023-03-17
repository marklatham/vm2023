class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.date :pdate
      t.string :place
      t.string :host

      t.timestamps
    end
  end
end
