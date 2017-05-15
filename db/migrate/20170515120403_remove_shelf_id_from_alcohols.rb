class RemoveShelfIdFromAlcohols < ActiveRecord::Migration[5.1]
  def change
    remove_column :alcohols, :shelf_id, :integer
  end
end
