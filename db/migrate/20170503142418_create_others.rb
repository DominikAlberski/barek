class CreateOthers < ActiveRecord::Migration[5.1]
  def change
    create_table :others do |t|
      t.string :type
      t.belongs_to :alcohol

      t.timestamps
    end
  end
end
