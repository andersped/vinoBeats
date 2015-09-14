class AddAppellationToWine < ActiveRecord::Migration
  def change
    add_column :wines, :appellation, :string
  end
end
