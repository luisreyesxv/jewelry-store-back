class ChangeItemForeignKeyToItemMaterials < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :item_id
    add_reference :orders, :item_materials, foreign_key: true
  end
end
