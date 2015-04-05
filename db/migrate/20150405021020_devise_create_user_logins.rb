class DeviseCreateUserLogins < ActiveRecord::Migration
  def self.up
    create_table :user_logins do |t|
      t.integer  :user_id
      t.datetime :sign_in_at
      t.inet     :sign_in_ip
  end

  add_index :user_logins, :user_id
  end

  def self.down
    drop_table :user_logins
  end

end
