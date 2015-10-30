class SessionsController < ApplicationController

  def login_params
    params.require(:user).permit(:username, :password)
  end
  

  def new
    # default: render 'new' template
  end

  def create

      if User.where(user_id: login_params[:username]).empty?
          flash[:notice] = "Invalid username/password combination"
          redirect_to login_path
          
        else
          @user = User.find_by_username(login_params[:username])
          session[:session_token] = @user.session_token
          #redirect_to home_path Redirect to home page 
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
    redirect_to movies_path
  end


end
