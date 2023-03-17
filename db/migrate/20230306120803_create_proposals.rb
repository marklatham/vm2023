class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|
      t.date :date_submitted
      t.date :date_agm
      t.string :company
      t.string :company_url
      t.string :ticker
      t.string :proposal_type
      t.string :proposal_url
      t.text :correspondence
      t.string :proxy_url
      t.boolean :in_proxy
      t.float :yes_percent

      t.timestamps
    end
  end
end
