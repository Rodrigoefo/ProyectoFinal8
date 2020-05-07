class Users::PressConferencesController < ApplicationController

  def index

      if params[:q].present?
          # @press_conferences = PressConference.where('title like ? OR address like ?', "%#{params[:q]}%", "%#{params[:q]}%").order("date DESC")

          @press_conferences = PressConference.joins(:organizator).where('press_conferences.title like ? OR press_conferences.address like ? OR organizators.name like ?', "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").where("date >= ?", DateTime.now.beginning_of_day).order("date DESC")
      else
          @press_conferences = PressConference.where(status: "publicada").where("date >= ?", DateTime.now.beginning_of_day).page(params[:page]).per(8).order("date DESC")


      end


  end

  def show
      @press_conference = PressConference.find(params[:id])
      @hash =Gmaps4rails.build_markers(@press_conference) do | press_conference, marker|
        marker.lat press_conference.latitude
        marker.lng press_conference.longitude

      @solicitudes = @press_conference.solicituds
      end

      pressconference = PressConference.find(params[:id])
      organizator = pressconference.organizator
      @popularity = organizator.follows
  end

  def follow
  @press_conference = PressConference.find(params[:id]) #Traigo al organizator de la PressConference
  current_user.follows.create(organizator: @press_conference.organizator) #Le asigno a los follows del currente_user el organizator de la PressConference
  redirect_to users_press_conference_path(@press_conference)
end

def unfollow
  @press_conference = PressConference.find(params[:id])
  follow = current_user.follows.find_by(organizator: @press_conference.organizator)
  follow.try(:destroy) #try invoca un método identificado por el símbolo y, si el receptor no responde al método, en lugar de romper la ejecucion del cíodigo y levantar un error, retorna un nil.
      redirect_to users_press_conference_path(@press_conference)

end


  def solicitar
    @press_conference = PressConference.find(params[:id])
    @press_conference.solicituds.find_or_create_by!(user: current_user) # Finds the first record with the given attributes, or creates a record with the attributes if one is not found
    redirect_to users_press_conferences_path, notice: "Solicitud Realizada"

  end

  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy
    redirect_to users_timeline_path

  end



end
