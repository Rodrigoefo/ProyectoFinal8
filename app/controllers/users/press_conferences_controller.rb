class Users::PressConferencesController < ApplicationController

  def index
      @press_conferences = PressConference.where(status: "publicada")

  end

  def show
      @press_conference = PressConference.find(params[:id])
  end


  def solicitar
    @press_conference = PressConference.find(params[:id])
    @press_conference.solicituds.find_or_create_by!(user: current_user)
    redirect_to users_press_conferences_path, notice: "Solicitud Realizada"

  end

  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    redirect_to users_timeline_path

  end



end
