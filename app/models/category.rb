class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :businesses_categories, dependent: :destroy
  has_many :businesses, through: :businesses_categories

  validates :name, presence: true

end
