class PasswordResetsController < ApplicationController
  before_action :require_no_authentication
  before_action :set_user, only: %i[edit update]

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      @user.set_password_reset_token
      PasswordResetMailer.with(user: User.first).reset_email.deliver_later
    end

    flash[:success] = t ".success"
    redirect_to new_session_path
  end

  def edit
  end

  private
  def set_user
    @user = User.find_by email: params[:user][:email],
                         password_reset_token: params[:user][:password_reset_token]
    
    redirect_to(new_session_path, flash: {warning: t('password_resets.fail')}) unless @user&.password_reset_period_valid?

  end
end