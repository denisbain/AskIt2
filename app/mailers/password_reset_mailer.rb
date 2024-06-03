class PasswordResetMailer < ApplicationMailer
  def reset_email
    @user = params[:user]
    mail to: @user.email, subject: I18n.t('mailer.password_reset.subject')
  end
end