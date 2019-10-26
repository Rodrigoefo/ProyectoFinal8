class PressConference < ApplicationRecord
  belongs_to :organizator, dependent: :destroy

  enum status: [:publicada, :cerrada, :borrador]
end
