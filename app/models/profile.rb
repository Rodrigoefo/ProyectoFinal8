class Profile < ApplicationRecord

  # validates :media_name, :phone, :description , presence: true,
  # validates :media_name, :phone, :description, presence: { message: "%{value} es un campo obligatorio" }
  # "OBSERVACÍÓN: En el modelo User tengo un "after_create :create_user_profile" que genera problemas con el precense del VALIDATES

  mount_uploader :photo, ImageUploader

  def is_completed
    if user.tradicional?
        if phone.nil? || media_name.nil?
          return false
        else
          return true
        end
    elsif user.influencer?
        if phone.nil? || social_network.nil? || social_network_url.nil?
          return false
        else
          return true
        end
      end
    else user.freelance?
      if phone.nil? || description.nil?
        return false
      else
        return true
      end
  end

  belongs_to :user

end
