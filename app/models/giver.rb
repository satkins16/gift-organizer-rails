class Giver < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :gifts, through: :gift_givers

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user }

  def gift_quantity
    self.gifts.count
  end

end
