class AddLatitudeAndLongitudeToAd < ActiveRecord::Migration
  def change
    add_column :ads, :latitude, :float
    add_column :ads, :longitude, :float
  end
end
