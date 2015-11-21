class MeetupEvent < ActiveRecord::Migration
  def change
    create_table :meetup_events do |t|
      t.string :name
      t.string :event_url
      t.string :address
      t.string :address_name
      t.string :address_city
      t.integer :time, limit: 8
      t.integer :duration
      t.integer :yes_rsvp_count
      t.timestamps
    end
  end
end
