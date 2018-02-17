class Giver < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :gifts, through: :gift_givers

  #validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :name_scope

  def gift_quantity
    self.gifts.count
  end

  private

  def name_scope
    if self.id == nil
      User.current.givers.each do |giver|
        if giver.name.downcase == self.name.downcase
          errors.add(:name, ": #{self.name} has already been taken.")
        end
      end
    end
  end

end
