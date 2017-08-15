class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def check_user_logged
    unless user_signed_in?
      flash[:error] = t "application.please_login"
      redirect_to root_url
    end
  end

  def verify_admin
    redirect_to root_url unless current_user.is_admin?
  end
end
