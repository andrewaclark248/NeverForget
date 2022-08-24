class AddKeysToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sid, :string
  	add_column :users, :auth_token, :string
  end
end
