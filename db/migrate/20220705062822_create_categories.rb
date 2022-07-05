class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.float :amount
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :categories, :users, column: :author_id
  end
end
