class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :email_id
      t.string :category

      t.timestamps
    end
  end
end
