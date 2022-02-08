class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings

  has_one_attached :photo
  has_many :reviews, through: :bookings


  validates :price_per_day, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :capacity, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_country_city_address,
    against: [ :country, :city, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
