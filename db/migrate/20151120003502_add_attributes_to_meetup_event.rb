class AddAttributesToMeetupEvent < ActiveRecord::Migration
  def change
    add_column :meetup_events, :name, :string
    add_column :meetup_events, :url, :string
    add_column :meetup_events, :yes_rsvp_count, :integer
  end
end
