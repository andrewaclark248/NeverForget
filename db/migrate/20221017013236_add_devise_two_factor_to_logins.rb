class AddDeviseTwoFactorToLogins < ActiveRecord::Migration[6.1]
  def change
    add_column :logins, :encrypted_otp_secret, :string
    add_column :logins, :encrypted_otp_secret_iv, :string
    add_column :logins, :encrypted_otp_secret_salt, :string
    add_column :logins, :consumed_timestep, :integer
    add_column :logins, :otp_required_for_login, :boolean
  end
end
