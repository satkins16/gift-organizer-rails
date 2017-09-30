class Giver < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :gifts, through: :gift_givers

  validates :name, presence: true
end
