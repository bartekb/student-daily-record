class Teacher::TeacherController < ApplicationController
  before_filter :authorize_teacher!

  protected

  def authorize_teacher!
    redirect_to root_url if current_user.blank? || !current_user.is_teacher?
  end
end