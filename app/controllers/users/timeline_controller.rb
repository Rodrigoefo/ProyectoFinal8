class Users::TimelineController < ApplicationController

  def index
    @solicitudes = current_user.solicituds
    
    organizator_id = current_user.follows.pluck(:organizator_id)
    @press_conferences = PressConference.where(status: "publicada").where(organizator_id: organizator_id)
  end


end
