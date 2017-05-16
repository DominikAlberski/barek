class AddIngredientKindToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :ingredient_kind_id, :integer
    add_column :ingredients, :ingredient_kind_type, :string
    remove_column :ingredients, :alcohol_id, :integer
    remove_column :ingredients, :other_ingredient_id, :integer
    
  end
end
