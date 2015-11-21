class Project < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :homepage
      t.string :url
      t.string :stage
      # Comma deliminated string
      t.string :technologies
      t.timestamps
    end
  end
end
