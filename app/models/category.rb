class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :category_businesses, dependent: :destroy
  has_many :businesses, through: :category_businesses

  validates :name, presence: true

end
