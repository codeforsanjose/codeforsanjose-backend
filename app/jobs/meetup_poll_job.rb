class MeetupPollJob < ActiveJob::Base
  queue_as :low_priority

  def perform(*args)
    meetup_client = Meetup.new(
      meetup_api_key: Figaro.env.meetup_api_key,
      meetup_url_name: Config.meetup_url_name
    )

    events = meetup_client.upcoming_events
    ActiveRecord::Base.connection_pool.with_connection do
      events.each do |event, event_attributes|
        MeetupEvent.new(
          name: event,
          url: event_attributes['url'],
          yes_rsvp_count: event_attributes['yes_rsvp_count']
        ).save
      end
    end
  end
end
