class Users::ProfilesController < ApplicationController


  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile=current_user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to users_profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
       params.require(:profile).permit(:photo, :phone, :description, :social_network, :social_network_url, :media_name)
     end
end
