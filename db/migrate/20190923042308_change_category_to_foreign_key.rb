class ChangeCategoryToForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :category
    add_column :categories, :valid_category_id, :integer
  end
end
