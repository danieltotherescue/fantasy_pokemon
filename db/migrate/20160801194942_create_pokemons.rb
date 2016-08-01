class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :moveset
      t.string :type
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
