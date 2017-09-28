class Giver < ApplicationRecord
  belongs_to :user
  has_many :gift_givers
  has_many :gifts, through: :gift_givers
end
