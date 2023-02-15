class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.boolean :win
      t.references :user, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: true
      t.references :map, null: false, foreign_key: true
      t.timestamps
    end
  end
end
