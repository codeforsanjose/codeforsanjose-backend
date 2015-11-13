class User < ActiveRecord::Base
  has_one :project
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.serialize :skills, Array
      t.timestamps
    end
  end
end
