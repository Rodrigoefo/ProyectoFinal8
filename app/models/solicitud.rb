class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :press_conference

  num status: [:in_progress, :accepted, :rejected]

end
