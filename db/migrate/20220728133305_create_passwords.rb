class CreatePasswords < ActiveRecord::Migration[6.1]
  def change
    create_table :passwords do |t|
      t.string :encrypted_password
      t.string :expiration_date
	  t.references :user
      t.timestamps
    end
  end
end
