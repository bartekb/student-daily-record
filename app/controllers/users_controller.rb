class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(params[:user])
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end
end