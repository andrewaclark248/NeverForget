class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :passwords, :pwd_strength, :string
  end
end
