class PressConference < ApplicationRecord
  belongs_to :organizator

  enum status: [:publicada, :cerrada, :borrador]
end
