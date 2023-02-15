class Match < ApplicationRecord
  belongs_to :user
  has_one :map
  has_one :hero

  validates :win, presence: true
end
