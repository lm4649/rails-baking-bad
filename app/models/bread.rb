class Bread < ApplicationRecord
  belongs_to :bakery
  has_many :orders, dependent: :destroy
end
