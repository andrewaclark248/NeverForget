class CreateProucts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_cents
      t.string :stripe_plan_name
      t.string :paypal_plan_name
      t.timestamps
    end
  end
end
