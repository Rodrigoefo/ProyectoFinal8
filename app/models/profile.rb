class Profile < ApplicationRecord

  # validates :media_name, :phone, :description , presence: true,
  validates :media_name, :phone, :description, presence: { message: "%{value} es un campo obligatorio" }
  mount_uploader :photo, ImageUploader

  def is_completed
    if phone.empty? || media_name.empty?
      return false
    else
      return true
    end
  end

  belongs_to :user

end
