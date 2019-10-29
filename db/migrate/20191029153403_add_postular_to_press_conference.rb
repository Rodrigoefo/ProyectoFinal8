class AddPostularToPressConference < ActiveRecord::Migration[5.2]
  def change
    add_column :press_conferences, :postulacion, :boolean, default: false
  end
end
