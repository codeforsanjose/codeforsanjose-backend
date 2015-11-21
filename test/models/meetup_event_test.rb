require 'test_helper'

# Why am I testing this:
#
# This is a basic set of model tests to guarantee that I can persist a
# meetup to the database.
class MeetupEventTest < ActiveSupport::TestCase
  test 'should not save the meetup event without an event name' do
    meetup_event = MeetupEvent.new
    assert_not meetup_event.save
  end

  test 'should save the meetup event with the proper attributes' do
    meetup_event = MeetupEvent.new(
      name: 'Hack night!',
      event_url: 'http://www.foobar.com',
      yes_rsvp_count: 40
    )

    assert_equal meetup_event.yes_rsvp_count, 40
    assert meetup_event.save
    assert meetup_event.persisted?
  end
end
