class Users::PressConferencesController < ApplicationController

  def index
      @press_conferences = PressConference.where(status: "publicada").page(params[:page]).per(5)

  end

  def show
      @press_conference = PressConference.find(params[:id])
  end

  def follow
  @press_conference = PressConference.find(params[:id])
  current_user.follows.create(organizator: @press_conference.organizator)
  redirect_to users_press_conference_path(@press_conference)
end

def unfollow
  @press_conference = PressConference.find(params[:id])
  follow = current_user.follows.find_by(organizator: @press_conference.organizator)
  follow.try(:destroy)
  redirect_to users_press_conference_path(@press_conference)
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
