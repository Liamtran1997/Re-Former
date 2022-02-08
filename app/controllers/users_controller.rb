class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_param)
      redirect_to @user
    else
      render 'new'
    end
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
