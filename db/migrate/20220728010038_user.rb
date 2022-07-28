class User < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :type
    end
  end
end
