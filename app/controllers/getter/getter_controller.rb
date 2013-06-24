class Getter::GetterController < ApplicationController
  before_filter :authorize_getter!

  protected

  def authorize_getter!
    redirect_to root_url if current_user.blank? || !current_user.is_getter?
  end
end