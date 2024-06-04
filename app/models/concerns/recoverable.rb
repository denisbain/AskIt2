module Recoverable
  extend ActiveSupport::Concern

  included do
    def set_password_reset_token
      self.update password_reset_token: digest(SecureRandom.urlsafe_base64),
                  password_reset_token_sent_at: Time.current
    end
    def password_reset_period_valid?
      password_reset_token_sent_at.present? && Time.current - password_reset_token_sent_at <= 60.minutes
    end
  end
end