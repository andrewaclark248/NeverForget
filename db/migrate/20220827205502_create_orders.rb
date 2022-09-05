class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user
      t.references :order
      t.string :token
      t.timestamps
    end
  end
end
