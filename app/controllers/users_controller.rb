class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_param)
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  private
  def user_param
    params.require(:user).permit(:username, :email, :password)
  end
end
