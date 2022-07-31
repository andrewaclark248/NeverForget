class AddUserNameToPasswords < ActiveRecord::Migration[6.1]
  def change
  	add_column :passwords, :username, :string
  end
end
