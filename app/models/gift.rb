class Gift < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :gift_givers
  has_many :givers, through: :gift_givers

  validates :name, presence: true
  accepts_nested_attributes_for :givers

  def givers_attributes=(giver_attributes)
    giver_attributes.values.each do |giver_attribute|
      unless giver_attribute[:name].blank?
        giver = Giver.find_or_create_by(giver_attribute)
        self.givers << giver
      end
    end
  end

end
