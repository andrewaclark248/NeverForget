class AddPlanToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :plan
    add_reference :users, :plan
  end
end
