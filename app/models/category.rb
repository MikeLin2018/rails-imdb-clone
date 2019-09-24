class Category < ApplicationRecord
  belongs_to :movie
  belongs_to :valid_category
end
