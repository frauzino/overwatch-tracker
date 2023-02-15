class RemoveTypeFromMaps < ActiveRecord::Migration[7.0]
  def change
    remove_column :maps, :type
  end
end
