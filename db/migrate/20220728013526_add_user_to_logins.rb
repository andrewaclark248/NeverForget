class AddUserToLogins < ActiveRecord::Migration[6.1]
  def change
  	add_reference :users, :logins
  end
end
