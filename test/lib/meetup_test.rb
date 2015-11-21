require 'test_helper'
require_relative '../../lib/meetup.rb'

# Why am I testing this:
#
# I need to know if my custom library works or not in its most basic
# capacity. All it's doing is perfomaning a simple unit test to guarantee
# execution.
describe MeetupWrapper do
  before do
    @meetup_client = MeetupWrapper.new(
      meetup_api_key: Figaro.env.meetup_api_key,
      meetup_url_name: Settings.meetup_url_name
    )
  end

  describe '.upcoming_events' do
    it 'should return an array of events' do
      upcoming_events = @meetup_client.upcoming_events
      upcoming_events.must_be_kind_of Hash

      upcoming_events.each do |event, event_attributes|
        event.must_be_kind_of String
        event_attributes['venue'].must_be_kind_of Hash
      end
    end
  end
end
