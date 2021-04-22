class AddChargeConfirmationToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :charge_confirmation, :string
  end
end
