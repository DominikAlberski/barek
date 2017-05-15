class CreateWhiskeys < ActiveRecord::Migration[5.1]
  def change
    create_table :whiskeys do |t|
      t.string :age
      t.string :region
      t.string :type
      t.string :cask
      t.text :description
      t.belongs_to :alcohol

      t.timestamps
    end
  end
end
