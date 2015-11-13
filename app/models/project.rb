class Project < ActiveRecord::Base
  has_many :users
  def change
    create_table :projects do |t|
      t.string :name
      t.string :homepage
      t.string :url
      t.string :stage
      t.serialize :technologies, Array
    end
  end
end
