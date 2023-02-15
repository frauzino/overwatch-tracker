class RenameHeroesToHeros < ActiveRecord::Migration[7.0]
  def change
    rename_table :heroes, :heros
  end
end
