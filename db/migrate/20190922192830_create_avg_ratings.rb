class CreateAvgRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :avg_ratings do |t|
      t.float :rating
      t.integer :movie_id

      t.timestamps
    end
  end
end
