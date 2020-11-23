class DeleteSlugFromItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :slug, :string
  end
end
