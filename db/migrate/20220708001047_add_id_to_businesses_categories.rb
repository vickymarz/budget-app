class AddIdToBusinessesCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses_categories, :id, :primary_key
  end
end
