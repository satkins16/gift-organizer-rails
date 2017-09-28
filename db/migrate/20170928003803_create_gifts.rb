class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
