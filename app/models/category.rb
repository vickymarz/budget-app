class Category < ApplicationRecord
  belongs_to :author
  has_many :users, dependent: :destroy
  has_many :category_businesses, dependent: :destroy
  has_many :businesses, through: :category_businesses
end
