class CreatePlan < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price_cents
      t.timestamps
    end
  end
end
