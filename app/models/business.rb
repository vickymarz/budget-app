class Business < ApplicationRecord
  belongs_to :author
  has_many :businesses_categories, dependent: :destroy
  has_many :categories, through: :businesses_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
