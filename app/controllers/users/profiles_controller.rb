class Users::ProfilesController < ApplicationController
  # require 'nokogiri'
  # require 'open-uri'

  def index
    @press_conferences = PressConference.all

  end

  def show
    @profile = current_user.profile

    # socialURL = current_user.profile.social_network_url
    # doc = Nokogiri::HTML(open(socialURL))
    #
    # @suscriptores = doc.search("window.ytInitialData.responseContext")
  end

  def edit

    @profile = current_user.profile
  end

  def update
    @profile=current_user.profile

    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to users_timeline_path, notice: 'Tu perfil se ha actualizado' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
     attrs = if current_user.freelance?
       [:photo, :phone, :description]
     elsif current_user.influencer?
       [:photo, :phone, :description, :social_network, :social_network_url]
     elsif current_user.tradicional?
       [:photo, :phone, :description, :media_name]
     end
     params.require(:user).permit(:name, :lastname, profile_attributes: attrs)
   end
end
