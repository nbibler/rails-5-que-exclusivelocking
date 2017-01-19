require 'test_helper'

# Inheriting from ActiveJob::TestCase isn't used here because it overrides
# ActiveJob::Base.queue_adapter to be a TestAdapter which runs all jobs
# synchronously and avoids Que entirely.
#
class ExclusiveLockJobTest < ActiveSupport::TestCase
  setup do
    Que.mode = :async
  end

  test 'show me ExclusiveLock errors in PostgreSQL log' do
    50.times do
      ExclusiveLockJob.perform_later
    end

    gets # Just to leave the process open until a keystroke
  end
end
