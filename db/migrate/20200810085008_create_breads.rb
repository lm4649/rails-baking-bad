class CreateBreads < ActiveRecord::Migration[6.0]
  def change
    create_table :breads do |t|
      t.references :bakery, null: false, foreign_key: true
      t.integer :price
      t.integer :min_quantity
      t.integer :max_quantity
      t.text :description

      t.timestamps
    end
  end
end
