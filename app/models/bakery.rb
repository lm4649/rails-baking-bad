class Bakery < ApplicationRecord
  belongs_to :user
  has_many :breads, dependent: :destroy
  validates :address, presence: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_number, presence: true, format: { with: /[^A-Za-z]{11,}/ }
  validates :description, presence: true, length: { minimum: 25 }
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
