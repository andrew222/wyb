class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :crypted_password, null: false
      t.string :password_salt, null: false
      t.string :persistence_token, null: false
      t.string :single_access_token
      t.string :perishable_token
      t.integer :login_count, null: false, default: 0
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      t.boolean :active
      t.boolean :approved
      t.boolean :confirmed
      t.date :birthday
      t.string :born_at

      t.timestamps null: false
    end
  end
end
