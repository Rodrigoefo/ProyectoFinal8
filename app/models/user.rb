class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


enum user_type: [:freelance, :influencer, :tradicional]

has_one :profile, dependent: :destroy
has_many :solicituds
has_many :press_conferences, through: :solicituds
has_many :follows


after_create :create_user_profile

accepts_nested_attributes_for :profile, update_only: true


 def solicituds_vigentes
   arr_ids = []
   self.solicituds.each do |sol|
      if sol.press_conference.date >= DateTime.now.beginning_of_day

        arr_ids.push(sol.id)
      end

    end

        Solicitud.where(id: arr_ids)
 end

private

def create_user_profile
   create_profile! if profile.nil?
 end


end
