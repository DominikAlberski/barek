class CreateOtherIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :other_ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end
