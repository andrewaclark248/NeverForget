class AddUserIdToOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :customer_id
  end
end
