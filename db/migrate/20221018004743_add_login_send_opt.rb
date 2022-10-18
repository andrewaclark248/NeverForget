class AddLoginSendOpt < ActiveRecord::Migration[6.1]
  def change
    add_column :logins, :mfa_send_option, :string
  end
end
