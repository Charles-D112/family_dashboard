class Tuto < ApplicationRecord
  has_many_attached :photos
  validates :name, uniqueness: true
  has_many :tasks
end
