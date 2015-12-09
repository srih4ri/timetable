class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      enable_extension "hstore"
      t.string :type
      t.hstore :attrs

      t.timestamps null: false
    end
  end
end
