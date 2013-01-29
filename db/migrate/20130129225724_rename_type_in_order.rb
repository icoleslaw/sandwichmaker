class RenameTypeInOrder < ActiveRecord::Migration
  def change
    rename_column :orders, :type, :ordertype
  end
end
