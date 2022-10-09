class AddExtAutoLogoffToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :chrome_ext_auto_logoff, :string
  end
end
