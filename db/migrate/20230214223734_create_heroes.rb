class CreateHeroes < ActiveRecord::Migration[7.0]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :role
      t.float :win_rate
      t.timestamps
    end
  end
end
