class UsersController < ApplicationController
  # before_action :require_login, only: [:show] ?
  before_action :require_logout, only: [:new, :create]
  
  def new
    render :new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      redirect_to cats_url
    else
      render json: ['error']
    end
  end
  
  def show
    user = User.find(params[:id])
    if user
      render :show
    else
      redirect_to cats_url
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
  
  def require_login
    redirect_to cats_url unless current_user
  end
end