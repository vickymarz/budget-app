class Business < ApplicationRecord
  belongs_to :author
  has_many :businesses_categories, dependent: :destroy
  has_many :categories, through: :businesses_categories

  validates :name, presence: true
end
