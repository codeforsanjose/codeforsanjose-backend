class MeetupEvent < ActiveRecord::Base
  attr_accessor :name, :url, :yes_rsvp_count
  validates :name, presence: true

  def change
    create_table :meetup_events do |t|
      t.string :name
      t.string :url
      t.integer :yes_rsvp_count
    end
  end
end
