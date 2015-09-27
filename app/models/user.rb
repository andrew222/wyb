class User < ActiveRecord::Base
  acts_as_authentic
  mount_uploader :avatar, AvatarUploader

  has_many :sent_notifications, foreign_key: :sender_id, class_name: "Notification"
  has_many :notifications, foreign_key: :receiver_id, class_name: "Notification"
  has_many :unread_notifications, -> {where status: 0}, foreign_key: :receiver_id, class_name: "Notification"

  has_many :languages, dependent: :destroy

  def unread_notifications_count
    self.unread_notifications.size
  end

  def language_names
    self.languages.map(&:name).join(" ")
  end
end
