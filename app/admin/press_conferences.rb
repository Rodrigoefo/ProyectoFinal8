ActiveAdmin.register PressConference do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :date, :time, :address, :status, :organizator_id, :postulacion, :latitude, :longitude
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :date, :time, :address, :status, :organizator_id, :postulacion, :latitude, :longitude]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :date
    column :address
    column :status
    column :organizator
    column :created_at

    actions
  end

end
