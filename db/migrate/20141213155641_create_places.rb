class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city
      t.string :image
      t.integer :hotel_id

      t.timestamps
    end
  end
end
