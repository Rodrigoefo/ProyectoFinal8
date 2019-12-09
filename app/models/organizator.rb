class Organizator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :press_conferences, dependent: :destroy
  has_many :solicituds, through: :press_conferences
  has_many :follows

  def is_followed_by_user?(user)
   follows.where(user: user).exists?
 end
end
