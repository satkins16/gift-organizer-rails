class Gift < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :givers, through: :gift_givers

  validates :name, presence: true



end
