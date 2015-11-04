class SessionsController < ApplicationController

  def login_params
    params.require(:user).permit(:username, :password)
  end
  

  def new
    # default: render 'new' template
  end

  def create

      if User.where(username: login_params[:username]).empty?
          flash[:notice] = "Invalid username/password combination"
          redirect_to login_path
          
        else
          @user = User.find_by_username(login_params[:username])
          session[:session_token] = @user.session_token
          redirect_to vendors_registration_path
      end

  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
    session[:session_token] = nil
    redirect_to login_path
  end


end
