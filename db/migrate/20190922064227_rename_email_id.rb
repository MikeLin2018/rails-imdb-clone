class RenameEmailId < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :email_id, :movie_id
  end
end
