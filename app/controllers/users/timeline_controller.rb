class Users::TimelineController < ApplicationController


  def index
    @solicitudes = current_user.solicituds
    
    @solicitudAceptada = current_user.solicituds.where(status: "accepted")
    @solicitudProgreso = current_user.solicituds.where(status: "in_progress")
    @follows = current_user.follows


    organizator_id = current_user.follows.pluck(:organizator_id)
    @press_conferences = PressConference.where(status: "publicada").where(organizator_id: organizator_id)




  end


end
