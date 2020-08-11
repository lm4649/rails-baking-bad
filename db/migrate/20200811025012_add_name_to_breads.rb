class AddNameToBreads < ActiveRecord::Migration[6.0]
  def change
    add_column :breads, :name, :string
  end
end
