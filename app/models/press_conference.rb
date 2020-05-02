class PressConference < ApplicationRecord
  belongs_to :organizator
  has_many :solicituds, dependent: :destroy
  has_many :users, through: :solicituds

  # validates :title, :description, :address , presence: true
  # FUE VALIDADO POR Bootstrap


  validates_length_of :title, :maximum => 90


  enum status: [:publicada, :cerrada, :borrador]



  geocoded_by :address
  after_validation :geocode


  def has_solicitud (user)
    solicituds.exists?(user: user)
  end


end
