class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end
