class AddColToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscription_status, :string
    add_column :users, :plan, :string
    add_column :users, :current_period_end, :string
  end
end
