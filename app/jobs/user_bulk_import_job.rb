class UserBulkImportJob < ApplicationJob
  queue_as :default

  def perform(archive_key, initiator)
    UserBulkImportService.call archive_key
    #При возникновении ошибки она также оправится на email.
    rescue StandardError => e
    Admin::UserMailer.with(user: initiator, error: e).bulk_import_fail.deliver_now
    #После завершения задачи отправляется письмо на почту кем была иницирована операция.
    else
    Admin::UserMailer.with(user: initiator).bulk_import_done.deliver_now
  end
end