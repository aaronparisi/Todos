class SessionsController < ApplicationController
  skip_before_action :is_not_logged_in

  def new

  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      login!(@user)
      # render json: @user
      redirect_to root_path
    else
      # render json: @user.errors.full_messages, status: 422
      redirect_to login_path
    end
  end

  def destroy
    @user = User.find_by(username: params[:username])

    logout!
    redirect_to login_path
  end
end
