class Users::PressConferencesController < ApplicationController

  def index
      @press_conferences = PressConference.where(status: "publicada")

  end

  def show
      @press_conference = PressConference.find(params[:id])
  end


 end
