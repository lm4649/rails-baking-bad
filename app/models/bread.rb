class Bread < ApplicationRecord
  belongs_to :bakery
  has_many :orders, dependent: :destroy
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10_000 }
  validates :min_quantity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 99 }
  validates :max_quantity, presence: true, numericality: { only_integer: true, greater_than: :min_quantity, less_than: 100 }
  validates :name, presence: true, length: { minimum: 2 }
  has_many_attached :photos
end
