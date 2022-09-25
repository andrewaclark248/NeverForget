class AddPwdMngToggleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :chrome_pwd_mng_toggle, :boolean
  end
end
