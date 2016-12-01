class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.uuid :user_id, primary_key: true
      t.string :email, null: false
      t.string :password

      t.timestamps null: false
    end
  end
end
