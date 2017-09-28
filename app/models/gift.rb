class Gift < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :gift_givers
  has_many :givers, through: :gift_givers
end
