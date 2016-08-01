class AddPokemonToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :pokemon, index: true
  end
end
