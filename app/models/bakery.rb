class Bakery < ApplicationRecord
  belongs_to :user
  has_many :breads, dependent: :destroy
end
