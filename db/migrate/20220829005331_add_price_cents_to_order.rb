class AddPriceCentsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_monetize :orders, :price, currency: { present: false }
  end
end
