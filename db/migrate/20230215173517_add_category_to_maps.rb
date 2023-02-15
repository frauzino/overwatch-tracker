class AddCategoryToMaps < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :category, :string
  end
end
