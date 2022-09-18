class RemoveKeyTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :keys_tables
  end
end
