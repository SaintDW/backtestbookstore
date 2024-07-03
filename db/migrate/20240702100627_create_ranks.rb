class CreateRanks < ActiveRecord::Migration[7.1]
  def change
    create_table :ranks do |t|
      t.integer :order
      t.integer :view
      t.references :book, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
