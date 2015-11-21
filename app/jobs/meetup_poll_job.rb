require_relative '../../lib/meetup.rb'

class MeetupPollJob < ActiveJob::Base
  queue_as :low_priority

  def perform
    meetup_client = MeetupWrapper.new(
      meetup_api_key: Figaro.env.meetup_api_key,
      meetup_url_name: Settings.meetup_url_name
    )

    events = meetup_client.upcoming_events
    ActiveRecord::Base.connection_pool.with_connection do
      events.each do |event, event_attributes|
        MeetupEvent.new(
          name: event,
          event_url: event_attributes['event_url'],
          address: event_attributes['venue']['address_1'],
          address_name: event_attributes['venue']['name'],
          address_city: event_attributes['venue']['city'],
          time: event_attributes['time'],
          duration: event_attributes['duration'],
          yes_rsvp_count: event_attributes['yes_rsvp_count']
        ).save
      end
    end
  end
end
