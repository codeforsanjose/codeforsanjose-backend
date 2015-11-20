class WelcomeController < ApplicationController
  def index
    event_pull = MeetupEvent.find_by name: 'Hack night!'
    @meetup_event = event_pull.name
  end
end
