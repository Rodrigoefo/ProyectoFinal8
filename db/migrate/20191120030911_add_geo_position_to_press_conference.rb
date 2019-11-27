class AddGeoPositionToPressConference < ActiveRecord::Migration[5.2]
  def change
    add_column :press_conferences, :latitude, :float
    add_column :press_conferences, :longitude, :float
  end
end
