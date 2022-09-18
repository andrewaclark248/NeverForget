class CreateKeysTable < ActiveRecord::Migration[6.1]
  def change
    create_table :keys_tables do |t|
      t.string :encrypted_key
      t.string :encrypted_value
      t.timestamps
    end
  end
end
