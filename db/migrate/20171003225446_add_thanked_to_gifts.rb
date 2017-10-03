class AddThankedToGifts < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :thanked, :integer, default: 0
  end
end
