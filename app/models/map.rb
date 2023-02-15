class Map < ApplicationRecord
  has_many :matches

  validates :name, presence: true
  validates :category, presence: true
end
