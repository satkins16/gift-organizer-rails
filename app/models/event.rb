class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gifts

  validates :name, :date, presence: true
end
