class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bread
  validates :pick_up, presence: true
  validate :pick_up_in_future
  validates :quantity, presence: true
  validates :status, presence: true

  def pick_up_in_future
    errors.add(:pick_up, 'pick up needs to be in the future') if DateTime.now > pick_up
  end

  def pick_up_in_future?
    DateTime.now <= pick_up
  end

  def delivered?
    return status == 3
  end
end
