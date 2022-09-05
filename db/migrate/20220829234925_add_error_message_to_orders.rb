class AddErrorMessageToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :error_message, :string
  end
end
