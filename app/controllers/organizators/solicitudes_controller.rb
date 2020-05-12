class Organizators::SolicitudesController < ApplicationController


  def update
     @solicitud = current_organizator.solicituds.find(params[:id])
     @solicitud.update(status: params[:status])

     if @solicitud.accepted?
       OrganizatorMailer.with(organizator: current_organizator, user: @solicitud.user).solicitud_confirmation.deliver_now
     elsif @solicitud.rejected?
        OrganizatorMailer.with(organizator: current_organizator, user: @solicitud.user).solicitud_rejected.deliver_now
     end
     respond_to do |format|
       format.html do
         redirect_to organizators_press_conference_path(@solicitud.press_conference)
       end
       format.js do
       end
     end

     # render template: "update.js.erb", locals: { solicitud: @solicitud }
   end

end
