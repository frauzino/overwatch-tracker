class Hero < ApplicationRecord
  has_many :matches

  validates :name, presence: true
  validates :role, presence: true
end
