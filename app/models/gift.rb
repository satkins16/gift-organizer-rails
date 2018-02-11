class Gift < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :givers, through: :gift_givers
  accepts_nested_attributes_for :givers, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true

  def thanked?
    self.thanked == 1
  end

  def gift_name
    "#{self.name}"
  end

end
