class AddLastOnlineTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_online_time, :date
  end
end
