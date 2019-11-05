class PressConference < ApplicationRecord
  belongs_to :organizator
  has_many :solicituds
  has_many :users, through: :solicituds

  enum status: [:publicada, :cerrada, :borrador]

  def has_solicitud (user)
    solicituds.exists?(user: user)
  end


end
