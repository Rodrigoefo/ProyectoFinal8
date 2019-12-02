class Organizators::SolicitudesController < ApplicationController


  def update
     @solicitud = current_organizator.solicituds.find(params[:id])
     @solicitud.update(status: params[:status])
     respond_to do |format|
       format.html do
         redirect_to organizators_press_conference_path(@solicitud.press_conference)
       end
       format.js do
       end
     end
     # render plain: "Hola Rodrigo
     # render template: "update.js.erb", locals: { solicitud: @solicitud }
   end

end
