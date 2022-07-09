class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :icon
      t.references :author, index: true
      t.timestamps
    end
    add_foreign_key :businesses, :users, column: :author_id
  end
end
