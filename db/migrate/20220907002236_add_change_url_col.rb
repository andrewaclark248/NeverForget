class AddChangeUrlCol < ActiveRecord::Migration[6.1]
  def change
    rename_column :urls, :url, :name

  end
end
