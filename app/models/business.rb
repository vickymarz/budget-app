class Business < ApplicationRecord
  belongs_to :author
  has_many :category_businesses, dependent: :destroy
  has_many :categories, through: :category_businesses

  validates :name, presence: true
end
