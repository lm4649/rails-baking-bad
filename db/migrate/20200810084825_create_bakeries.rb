class CreateBakeries < ActiveRecord::Migration[6.0]
  def change
    create_table :bakeries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end
