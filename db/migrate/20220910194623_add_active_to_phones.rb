class AddActiveToPhones < ActiveRecord::Migration[6.1]
  def change
    add_column :phones, :active, :integer
  end
end
