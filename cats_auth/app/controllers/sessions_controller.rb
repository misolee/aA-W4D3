class SessionsController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :require_logout, only: [:new, :create]
  
  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      login!(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
  
  private
  def require_login
    redirect_to cats_url unless current_user
  end
end