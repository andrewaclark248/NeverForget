class CreateUrl < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :url
      t.references :password
      t.timestamps
    end
  end
end
