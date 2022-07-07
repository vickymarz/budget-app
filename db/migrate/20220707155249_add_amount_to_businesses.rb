class AddAmountToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :amount, :float
  end
end
