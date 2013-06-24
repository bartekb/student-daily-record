class Admin::AdminController < ApplicationController
  before_filter :authorize_admin!

  protected

  def authorize_admin!
    redirect_to root_url if current_user.blank? || !current_user.is_admin?
  end
end