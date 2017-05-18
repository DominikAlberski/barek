class RemovePhotoFromAlcohols < ActiveRecord::Migration[5.1]
  def change
    remove_column :alcohols, :photo, :string
  end
end
