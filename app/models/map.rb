class Map < ApplicationRecord
  has_many :matches

  validates :name, presence: true
  validates :type, presence: true
end
