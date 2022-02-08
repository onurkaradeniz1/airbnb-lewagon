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

  def average_rating
    if self.bookings.empty?
      return 0
    else
      ratings = []
      self.bookings do |booking|
        ratings << booking.review.rating
      end
      return (ratings.sum) / ratings.count
    end
  end
end
