module Recoverable
  extend ActiveSupport::Concern

  included do
    def set_password_reset_token
      self.update password_reset_token: digest(SecureRandom.urlsafe_base64),
                  password_reset_token_sent_at: Time.current
    end
  end
end