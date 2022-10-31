class UserController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def index
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :name, :email))
    if @user.save
      log_in @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      #need requirement
      flash.now[:alert] << "Error: Please check the username password requirements"
      end
      render :action => 'new'
    end
  end

  def delete
  end
end
