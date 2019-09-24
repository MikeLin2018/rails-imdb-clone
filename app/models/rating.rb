class Rating < ApplicationRecord
  enum rating: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  has_many :users
  has_many :movies
end
