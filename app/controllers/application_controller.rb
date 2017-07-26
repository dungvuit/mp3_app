class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def verify_admin
    redirect_to root_url unless current_user.is_admin?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_authors
    @author = Author.all.collect {|author| [author.name, author.id]}
  end

  def load_categories
    @category = Category.all.collect {|category| [category.name, category.id]}
  end
end
