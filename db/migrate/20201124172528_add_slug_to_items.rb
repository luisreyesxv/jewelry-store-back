class AddSlugToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :slug, :string
  end
end
