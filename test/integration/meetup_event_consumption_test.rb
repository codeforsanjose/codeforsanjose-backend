require 'test_helper'
require 'database_cleaner'
require_relative '../../lib/meetup.rb'

# Why this is being tested:
#
# I'm finding it difficult to test the internal working of my MeetupPollJob
# I created this integration test to figure out why. The downside of this test
# is that it isn't DRY and covers some of the responsibilities of the unit
# tests for the model.
describe MeetupEvent do
  before do
    DatabaseCleaner.strategy = :truncation, { only: %w( meetup_events ) }

    meetup_client = MeetupWrapper.new(
      meetup_api_key: Figaro.env.meetup_api_key,
      meetup_url_name: Settings.meetup_url_name
    )

    @meetup_events = meetup_client.upcoming_events
  end

  after do
    DatabaseCleaner.clean
  end

  describe 'interaction between MeetupWrapper and MeetupEvent' do
    it 'should save each event from MeetupWrapper.upcoming_events' do
      @meetup_events.each do |event, event_attributes|
        event = MeetupEvent.new(
          name: event,
          event_url: event_attributes['event_url'],
          address: event_attributes['venue']['address_1'],
          address_name: event_attributes['venue']['name'],
          address_city: event_attributes['venue']['city'],
          time: event_attributes['time'],
          duration: event_attributes['duration'],
          yes_rsvp_count: event_attributes['yes_rsvp_count']
        )

        event.event_url.must_match('http')
      end
    end
  end
end
