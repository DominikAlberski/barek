class RenameCocktailsInIngredientsToCoctails < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :cocktail_id, :coctail_id
  end
end
