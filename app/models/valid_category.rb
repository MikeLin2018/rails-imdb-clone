class ValidCategory < ApplicationRecord
  has_many :categories, dependent: :delete_all
end
