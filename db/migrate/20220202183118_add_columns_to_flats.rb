class AddColumnsToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :first_day_of_flat, :date
    add_column :bookings, :last_day_of_flat, :date

    remove_column :bookings, :date_booked
  end
end
