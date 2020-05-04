ActiveAdmin.register Contactme do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :email
    column :description
    column :created_at

    actions
  end

end
