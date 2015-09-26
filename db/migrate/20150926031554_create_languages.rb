class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.boolean :mother_language, null: false, default: false
      t.integer :experience
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
