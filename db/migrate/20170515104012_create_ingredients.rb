class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.belongs_to :cocktail, index: true
      t.belongs_to :alcohol, index: true
      t.belongs_to :other_ingredient, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
