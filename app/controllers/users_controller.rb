class UsersController < ApplicationController

  def index
    @user = User.find(params[:identifier])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Registration Successful"
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new, status: :unprocessable_entity  
    end
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation)
  end

end
