class RemovePhone < ActiveRecord::Migration[6.1]
  def change
    remove_column :logins, :phone
    add_column :logins, :mfa_phone, :string
  end
end
