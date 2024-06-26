class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
