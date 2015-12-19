namespace :meetup_poll_job do
  desc 'Run the Meetup Poll Job'
  task perform_now: :environment do
    MeetupPollJob.perform_now
  end
end
