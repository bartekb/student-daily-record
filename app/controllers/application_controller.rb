class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :resolve_school
  before_filter :set_locale

  def resolve_school
    @school = user_signed_in? ? current_user.school : nil
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
