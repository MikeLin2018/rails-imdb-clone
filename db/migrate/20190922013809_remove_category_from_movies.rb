class RemoveCategoryFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :category
  end
end
