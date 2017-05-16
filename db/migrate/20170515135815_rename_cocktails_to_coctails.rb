class RenameCocktailsToCoctails < ActiveRecord::Migration[5.1]
  def change
    rename_table :cocktails, :coctails
    # rename_column :ingredients, :cocktails, :coctails
  end
end
