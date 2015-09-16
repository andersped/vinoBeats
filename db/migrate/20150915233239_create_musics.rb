class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.string :result
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
