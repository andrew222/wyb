class Channel < ActiveRecord::Base
  belongs_to :user
  has_many :chat_messages, dependent: :destroy
end
