class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :is_not_logged_in, only: [ :new, :create ]

  def index
    # do I even want this feature?
  end

  def show
    # can THIS specific route be json api?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      # ?  do I have to log out here?
      logout!
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
