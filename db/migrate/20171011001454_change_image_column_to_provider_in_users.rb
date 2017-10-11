class ChangeImageColumnToProviderInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :image, :provider
  end
end
