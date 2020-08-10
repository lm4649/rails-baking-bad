class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bread
end
