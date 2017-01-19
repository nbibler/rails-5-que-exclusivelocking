class ExclusiveLockJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # nothing is necessary here.
  end
end
