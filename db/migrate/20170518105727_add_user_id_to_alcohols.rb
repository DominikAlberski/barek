class AddUserIdToAlcohols < ActiveRecord::Migration[5.1]
  def change
    add_column :alcohols, :user_id, :integer, index: true
  end
end
