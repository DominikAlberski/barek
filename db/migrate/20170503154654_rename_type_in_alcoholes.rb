class RenameTypeInAlcoholes < ActiveRecord::Migration[5.1]
  def change
    rename_column :alcohols, :type, :kind
    rename_column :liqueurs, :type, :kind
    rename_column :others, :type, :kind
    rename_column :vodkas, :type, :kind
    rename_column :whiskeys, :type, :kind
    rename_column :wines, :type, :kind
  end
end
