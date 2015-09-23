class Notification < ActiveRecord::Base
  enum status: [:unread, :read, :hidden]
end
