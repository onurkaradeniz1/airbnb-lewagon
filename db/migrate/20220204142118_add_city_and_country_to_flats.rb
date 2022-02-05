class AddCityAndCountryToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :city, :string
    add_column :flats, :country, :string
  end
end
