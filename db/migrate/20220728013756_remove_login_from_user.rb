class RemoveLoginFromUser < ActiveRecord::Migration[6.1]
  def change
  	remove_column :users, :logins_id
  end
end
