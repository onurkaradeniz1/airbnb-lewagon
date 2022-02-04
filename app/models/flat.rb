class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_one_attached :photo

  validates :price_per_day, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :capacity, presence: true
end
