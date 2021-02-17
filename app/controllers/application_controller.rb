class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :current_user
  before_action :is_not_logged_in
  skip_before_action :verify_authenticity_token  # ! maybe add axios to react components

  def current_user
    @currentUser ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_not_logged_in
    if ! @currentUser
      redirect_to login_url
    end
  end

  def login!(user)
    session[:user_id] = user.id.to_s
  end

  def logout!
    session.delete(:user_id)
  end
end
