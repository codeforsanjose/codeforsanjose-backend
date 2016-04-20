class WelcomeController < ApplicationController
  def index

    @meetup_events = MeetupEvent.find_each
  end
end
