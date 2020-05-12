class OrganizatorMailer < ApplicationMailer
  def solicitud_confirmation
    @organizator = params[:organizator]
    @user = params[:user]
    mail(to: @user.email, from: @organizator.email,  subject: "Confirmación de  solicitud aceptada")
  end

  def solicitud_rejected
    @organizator = params[:organizator]
    @user = params[:user]
    mail(to: @user.email, from: @organizator.email,  subject: "Confirmación de  solicitud rechazada")
  end
end
