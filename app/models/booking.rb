class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  has_one :review, dependent: :destroy

  validates :total_price, presence: true
  validates :first_day_of_booking, presence: true
  validates :last_day_of_booking, presence: true
end
