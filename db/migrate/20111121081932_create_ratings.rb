class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :sensis_id
      t.integer :rating
      t.string :restaurant_name
      t.string :user_name

      t.timestamps
    end
  end
end
