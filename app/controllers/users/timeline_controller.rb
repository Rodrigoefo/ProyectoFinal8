class Users::TimelineController < ApplicationController

  def index

    @solicitudes = current_user.solicituds_vigentes

    @solicitudAceptada = current_user.solicituds_vigentes.where(status: "accepted")
    @solicitudProgreso = current_user.solicituds_vigentes.where(status: "in_progress")

    @follows = current_user.follows


    organizator_id = current_user.follows.pluck(:organizator_id)
    @press_conferences = PressConference.where(status: "publicada").where(organizator_id: organizator_id).where("date >= ?", DateTime.now.beginning_of_day)

  end
end
