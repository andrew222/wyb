class Notification < ActiveRecord::Base
  enum status: [:unread, :read, :hidden]

  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'

  validates_presence_of :content, :title
end
