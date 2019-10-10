class Users::TimelineController < ApplicationController

  def index
    @user = current_user

  end
end
