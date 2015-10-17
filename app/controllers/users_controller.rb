class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if User.exists?(email: @user.email)
      @user_exist = true
      render "new"
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to signup_path
      end
    end

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
