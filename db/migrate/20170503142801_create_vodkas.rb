class CreateVodkas < ActiveRecord::Migration[5.1]
  def change
    create_table :vodkas do |t|
      t.string :type
      t.belongs_to :alcohol

      t.timestamps
    end
  end
end
