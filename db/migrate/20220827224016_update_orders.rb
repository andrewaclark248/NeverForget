class UpdateOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :order_id
    add_reference :orders, :product
  end
end
