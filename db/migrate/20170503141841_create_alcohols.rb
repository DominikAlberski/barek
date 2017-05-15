class CreateAlcohols < ActiveRecord::Migration[5.1]
  def change
    create_table :alcohols do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.string :country
      t.integer :alk
      t.decimal :price, precision: 5, scale: 2
      t.string :photo
      t.belongs_to :shelf

      t.timestamps
    end
  end
end
