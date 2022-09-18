class CreateKeys2 < ActiveRecord::Migration[6.1]
  def change
    create_table :keys do |t|
      t.string :encrypted_key
      t.string :encrypted_value
      t.references :user
      t.timestamps
    end
  end
end
