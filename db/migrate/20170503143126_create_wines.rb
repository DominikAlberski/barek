class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :type
      t.string :color
      t.belongs_to :alcohol

      t.timestamps
    end
  end
end
