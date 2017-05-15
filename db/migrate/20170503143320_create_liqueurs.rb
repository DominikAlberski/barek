class CreateLiqueurs < ActiveRecord::Migration[5.1]
  def change
    create_table :liqueurs do |t|
      t.string :type
      t.belongs_to :alcohol

      t.timestamps
    end
  end
end
