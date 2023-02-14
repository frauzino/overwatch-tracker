class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :type
      t.float :win_rate
      t.timestamps
    end
  end
end
