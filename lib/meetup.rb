# encoding: utf-8
require 'meetup_client'

# @class A small wrapper around the meetup_client library
# @author Tyler Hampton
# @since 0.1.0
class Meetup
  attr_accessor :meetup_url_name
  attr_writer   :meetup_api_key

  def initialize(params)
    @meetup_url_name = params[:meetup_url_name]

    MeetupClient.configure do |config|
      config.api_key = params[:meetup_api_key]
    end

    @meetup = MeetupApi.new
  end

  # Returns a list of upcoming meetups
  #
  # @return [Hash]
  #
  # @example List meetups
  #    Meetup.new(named_params).upcoming_events
  def upcoming_events
    events = @meetup.events({
      group_urlname: @meetup_url_name,
      status: 'upcoming'
    })['results']

    events.inject({}) do |accum, results|
      accum[results['name']] = {
        'venue' => results['venue'],
        'time' => results['time'],
        'duration' => results['duration'],
        'event_url' => results['event_url'],
        'yes_rsvp_count' => results['yes_rsvp_count']
      }

      accum
    end
  end
end
