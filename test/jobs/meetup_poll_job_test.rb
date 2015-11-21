require 'test_helper'

class MeetupPollJobTest < ActiveJob::TestCase
  def test_job
    assert_enqueued_jobs 0
    MeetupPollJob.perform_later
    assert_enqueued_jobs 1
  end
end
