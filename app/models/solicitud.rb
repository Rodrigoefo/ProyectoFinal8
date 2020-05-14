class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :press_conference

  enum status: [:in_progress, :accepted, :rejected]
  STATUS_TEXT = {"in_progress" => "En progreso", "accepted" => "Aceptada", "rejected" => "Rechazada"}

def status_disponibles
    Solicitud.statuses.keys - [status]

end

def current_status_text

  Solicitud::STATUS_TEXT[status]
  
end




end
