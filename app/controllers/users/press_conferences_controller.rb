class Users::PressConferencesController < ApplicationController

  def index
      @press_conferences = PressConference.where(status: "publicada")

  end

  def show
      @press_conference = PressConference.find(params[:id])
  end

  # def update
  #   @press_conference = PressConference.new(press_conference_params)
  #       if @press_conference.update(press_conference_params)
  #         @press_conference.toggle(:postulacion)
  #         redirect_to users_press_conferences_path
  #
  #       else
  #         render :edit
  #
  #       end
  #   end
  #
  #   private
  #
  #   def press_conference_params
  #      params.require(:press_conference).permit(:title, :description, :date, :time, :address, :postulacion)
  #
  #   end


end
