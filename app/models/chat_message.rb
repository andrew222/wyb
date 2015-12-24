class ChatMessage < ActiveRecord::Base
  belongs_to :channel
end
