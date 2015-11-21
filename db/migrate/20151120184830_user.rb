class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      # Comma deliminated string
      t.string :technologies
      t.timestamps
    end
  end
end
