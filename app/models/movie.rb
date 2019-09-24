class Movie < ApplicationRecord
  has_many :ratings, dependent: :delete_all
  has_one :avg_rating, dependent: :delete
  has_many :category, dependent: :delete_all
end
