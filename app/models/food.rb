class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: false, greater_than: 0 }
end
