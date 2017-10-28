class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.new[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def params_user
    params.require(:user).permit(:email,:password)
  end
end
