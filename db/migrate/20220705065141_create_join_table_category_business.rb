class CreateJoinTableCategoryBusiness < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :businesses do |t|
      t.index [:category_id, :business_id]
      t.index [:business_id, :category_id]
    end
  end
end
