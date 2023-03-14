class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measurement_unit, presence: true
end