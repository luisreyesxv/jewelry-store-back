class ChangeImageForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_reference :images, :item, index: true, foreign_key: true
    add_reference :images, :item_material, index: true, foreign_key: true
  end
end
