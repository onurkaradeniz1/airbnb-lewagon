class AddEndDateToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :end_date, :date
  end
end
