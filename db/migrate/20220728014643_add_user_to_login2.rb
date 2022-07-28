class AddUserToLogin2 < ActiveRecord::Migration[6.1]
  def change
  	add_reference :logins, :user
  end
end
