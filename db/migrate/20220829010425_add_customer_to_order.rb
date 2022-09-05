class AddCustomerToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :customer
  end
end
