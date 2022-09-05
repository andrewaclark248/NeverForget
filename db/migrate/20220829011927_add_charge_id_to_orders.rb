class AddChargeIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :charge_id
  end
end
