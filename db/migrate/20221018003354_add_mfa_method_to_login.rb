class AddMfaMethodToLogin < ActiveRecord::Migration[6.1]
  def change
    add_column :logins, :mfa_email, :string
    add_column :logins, :phone, :string
  end
end
