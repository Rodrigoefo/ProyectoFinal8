class Users::TimelineController < ApplicationController

  def index
    @solicitudes = current_user.solicituds

  end

end
