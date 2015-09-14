class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :varietal
      t.string :vintage
      t.string :winery
      t.string :vineyard
      t.string :image
      t.string :rating
      t.integer :owner_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
