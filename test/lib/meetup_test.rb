require 'test_helper'
require_relative '../../lib/meetup.rb'

describe Meetup do
  before do
    @meetup_client = Meetup.new(
      meetup_api_key: Figaro.env.meetup_api_key,
      meetup_url_name: 'Code-for-San-Jose'
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
