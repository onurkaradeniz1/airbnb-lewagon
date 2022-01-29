class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.integer :price_per_day
      t.string :address
      t.string :pictures
      t.date :availability
      t.text :description
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
