class Profile < ApplicationRecord

  # validates :media_name, :phone, :description , presence: true,
  # validates :media_name, :phone, :description, presence: { message: "%{value} es un campo obligatorio" }
  # "OBSERVACÍÓN: En el modelo User tengo un "after_create :create_user_profile" que genera problemas con el precense del VALIDATES

  mount_uploader :photo, ImageUploader

  def is_completed
    if user.tradicional?
        if phone.empty? || media_name.empty?
          return false
        else
          return true
        end
    else user.influencer?
        if phone.empty? || social_network.empty? || social_network_url.empty?
          return false
        else
          return true
        end
      end
  end

  belongs_to :user

end
