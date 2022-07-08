class RemoveIconFromBusinesses < ActiveRecord::Migration[7.0]
  def change
    remove_column :businesses, :icon, :string
  end
end
