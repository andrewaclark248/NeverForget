class AddBlockTorToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :logins, :enable_tor, :boolean
  end
end
