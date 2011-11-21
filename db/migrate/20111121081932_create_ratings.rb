class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :sensis_id
      t.float :rating
      t.integer :number_of_ratings
      t.timestamps
    end
  end
end
