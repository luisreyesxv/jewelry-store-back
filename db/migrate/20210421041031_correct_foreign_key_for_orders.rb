class CorrectForeignKeyForOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :item_materials, index: true, foreign_key: true
    add_reference :orders, :item_material, index: true, foreign_key: true
  end
end
