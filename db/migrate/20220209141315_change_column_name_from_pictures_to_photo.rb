class ChangeColumnNameFromPicturesToPhoto < ActiveRecord::Migration[6.1]
  def change
    rename_column :flats, :pictures, :photo
  end
end
