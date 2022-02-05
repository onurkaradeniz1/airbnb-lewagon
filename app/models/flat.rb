class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :reviews, through: :bookings

  validates :price_per_day, presence: true
  validates :address, presence: true
  validates :availability, presence: true
  validates :capacity, presence: true
end
