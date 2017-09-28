class CreateGiftGivers < ActiveRecord::Migration[5.1]
  def change
    create_table :gift_givers do |t|
      t.integer :gift_id
      t.integer :giver_id

      t.timestamps
    end
  end
end
