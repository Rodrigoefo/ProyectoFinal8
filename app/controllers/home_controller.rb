class HomeController < ApplicationController


  def index
    @press_conferences = PressConference.where(status: "publicada").limit(2).order("created_at DESC")


  end

  def contact

  end

  def team

  end

  def about

  end
end
