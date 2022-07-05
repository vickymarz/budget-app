class Category < ApplicationRecord
  belongs_to :author
  has_many :users, dependent: :destroy
  has_many :category_businesses, dependent: :destroy
  has_many :businesses, through: :category_businesses

  validates :name, presence: true

  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
