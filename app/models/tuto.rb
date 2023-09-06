class Tuto < ApplicationRecord
  has_many_attached :photos
  validates :name, uniqueness: true
end
