class Organizators::SolicitudesController < ApplicationController


  def update
     @solicitud = current_organizator.solicituds.find(params[:id])
     @solicitud.update(status: params[:status])

     if Rails.env.development?
       if @solicitud.accepted?
         OrganizatorMailer.with(organizator: current_organizator, user: @solicitud.user, press_conference: @solicitud.press_conference).solicitud_confirmation.deliver_now
       elsif @solicitud.rejected?
          OrganizatorMailer.with(organizator: current_organizator, user: @solicitud.user, press_conference: @solicitud.press_conference).solicitud_rejected.deliver_now
       end
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
