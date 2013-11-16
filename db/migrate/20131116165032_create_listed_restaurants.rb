class CreateListedRestaurants < ActiveRecord::Migration
  def change
    create_table :listed_restaurants do |t|
            t.integer :user_id
            t.integer :restaurant_id
      t.timestamps
    end

    add_index :listed_restaurants, [:user_id, :restaurant_id]
  end
end
