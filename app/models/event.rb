class Event < ApplicationRecord
  belongs_to :user
  has_many :gifts

  validates :name, :date, presence: true
end
