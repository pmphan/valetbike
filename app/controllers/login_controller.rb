class LoginController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_path
    else
      flash[:alert] = 'Error: Wrong Username or Password'
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    @_current_user = nil
    redirect_to root_path
  end
end

  # def index
  # end

  # def edit
  # end


#   def index
#   end

#   def new
#   end

#   def edit
#   end
# end
