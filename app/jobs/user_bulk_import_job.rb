class UserBulkImportJob < ApplicationJob
  queue_as :default

  def perform(archive_key, initiator)

  end
end