class AddUserToPhone < ActiveRecord::Migration[6.1]
  def change
    add_reference :phones, :user
  end
end
