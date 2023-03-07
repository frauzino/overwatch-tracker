class Match < ApplicationRecord
  belongs_to :user
  belongs_to :map
  belongs_to :hero

  # validates :win, presence: true
end
