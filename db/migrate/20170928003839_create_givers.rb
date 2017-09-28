class CreateGivers < ActiveRecord::Migration[5.1]
  def change
    create_table :givers do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
