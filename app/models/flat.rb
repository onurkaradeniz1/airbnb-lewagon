class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings

  validates :price_per_day, presence: true
  validates :address, presence: true
  validates :availability, presence: true
  validates :capacity, presence: true
end
