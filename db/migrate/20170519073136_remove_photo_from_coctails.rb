class RemovePhotoFromCoctails < ActiveRecord::Migration[5.1]
  def change
    remove_column :coctails, :photo, :string
    add_attachment :coctails, :image
  end
end
