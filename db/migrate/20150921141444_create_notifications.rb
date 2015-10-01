class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :content
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
