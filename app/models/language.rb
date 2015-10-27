class Language < ActiveRecord::Base
  mount_uploader :certificate, AvatarUploader
  belongs_to :user

  validates_presence_of :name
end
