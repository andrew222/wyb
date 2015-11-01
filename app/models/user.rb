class User < ActiveRecord::Base
  acts_as_authentic
  mount_uploader :avatar, AvatarUploader

  has_many :sent_notifications, foreign_key: :sender_id, class_name: "Notification"
  has_many :notifications, foreign_key: :receiver_id, class_name: "Notification"
  has_many :unread_notifications, -> {where status: 0}, foreign_key: :receiver_id, class_name: "Notification"

  has_many :languages, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships

  scope :exclude, lambda{|uid| where.not(id: uid).order("LOWER(nickname) ASC")}
  scope :onlines, -> {where("last_online_time >= ? OR last_request_at >= ?", Time.now - 5.minute, Time.now - 5.minute).order("LOWER(nickname) ASC")}

  def unread_notifications_count
    self.unread_notifications.size
  end

  def online?
    !self.last_online_time.blank? && (self.last_request_at >= Time.now - 5.minute || self.last_online_time >= (Time.now - 5.minute) )
  end

  def language_names
    self.languages.map(&:name).join(" ")
  end

  def is_contact?(user_id)
    !self.friendships.find_by_friend_id(user_id).blank?
  end
end
