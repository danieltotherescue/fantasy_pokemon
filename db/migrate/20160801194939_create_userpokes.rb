class CreateUserpokes < ActiveRecord::Migration
  def change
    create_table :userpokes do |t|
      t.references :pokemon, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
