class Organizators::SolicitudesController < ApplicationController


  def update
    # Solicitud.where(organizator_id: current_organizator.id, id: params[:id])
    @solicitud = current_organizator.solicituds.find(params[:id])


    respond_to do |format|
      if(@solicitud.update(status: params[:status]))
        format.html do
          redirect_to organizators_press_conference_path(@solicitud.press_conference)
        end
        else
        format.js do

        end
      end
    end
  end

end
