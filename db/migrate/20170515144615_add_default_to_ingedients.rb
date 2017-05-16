class AddDefaultToIngedients < ActiveRecord::Migration[5.1]
  def change
    change_column_default :ingredients, :quantity, to: 1
  end
end
