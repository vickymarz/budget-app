class Business < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :businesses_categories, dependent: :destroy
  has_many :categories, through: :businesses_categories

  validates :amount, presence: true
end