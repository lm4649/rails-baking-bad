class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bread, null: false, foreign_key: true
      t.datetime :pick_up
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
