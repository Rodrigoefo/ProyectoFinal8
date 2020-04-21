class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :press_conference

  enum status: [:in_progress, :accepted, :rejected]

def status_disponibles
  
    Solicitud.statuses.keys - [status]

end


end
