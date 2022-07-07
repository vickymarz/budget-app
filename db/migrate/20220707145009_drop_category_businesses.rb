class DropCategoryBusinesses < ActiveRecord::Migration[7.0]
  def change
    drop_table :category_businesses
  end
end
