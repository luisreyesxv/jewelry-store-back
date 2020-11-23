class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :purchased_price
      t.string :delivery
      t.string :status
      t.timestamp :order_date


      t.timestamps
    end
  end
end
