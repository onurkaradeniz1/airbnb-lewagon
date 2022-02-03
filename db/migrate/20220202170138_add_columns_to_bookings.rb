class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :first_day_of_booking, :date
    add_column :bookings, :last_day_of_booking, :date

    remove_column :bookings, :date_booked
  end
end
