class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :flats, :availability, :start_date
  end
end
