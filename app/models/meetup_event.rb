class MeetupEvent < ActiveRecord::Base
  validates :name, presence: true
end
