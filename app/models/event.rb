class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gifts

  validates :name, :date, presence: true

  def formatted_date
    self.date.strftime("%-m/%-d/%Y")
  end
end
