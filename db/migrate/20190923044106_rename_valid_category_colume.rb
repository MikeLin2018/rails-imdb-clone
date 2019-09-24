class RenameValidCategoryColume < ActiveRecord::Migration[5.2]
  def change
    rename_column :valid_categories, :category, :name
  end
end
