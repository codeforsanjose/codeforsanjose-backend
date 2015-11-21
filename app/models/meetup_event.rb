class MeetupEvent < ActiveRecord::Base
  validates :name, presence: true
  validates :event_url, presence: true, uniqueness: true
end
