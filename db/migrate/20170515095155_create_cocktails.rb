class CreateCocktails < ActiveRecord::Migration[5.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.belongs_to :user
      t.timestamps
    end
  end
end
