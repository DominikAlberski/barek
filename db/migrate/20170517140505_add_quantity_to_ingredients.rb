class AddQuantityToIngredients < ActiveRecord::Migration[5.1]
  def change
    change_column :Ingredients, :quantity, :string
  end
end
