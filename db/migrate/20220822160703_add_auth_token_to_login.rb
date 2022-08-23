class AddAuthTokenToLogin < ActiveRecord::Migration[6.1]
  def change
    add_column :logins, :auth_token, :string
  end
end
