class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slug
      t.decimal :price
      t.boolean :active
      t.string :detail
      t.string :description

      t.timestamps
    end
  end
end
