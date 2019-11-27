class Organizators::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:press_conference_id].present?
      @press_conference = PressConference.find(params[:press_conference_id])
    end
  end

end
