class SessionsController < ApplicationController
  skip_before_filter	:set_current_user
  
  def login_params
    params.require(:user).permit(:username, :password)
  end
  

  def new
    # default: render 'new' template
  end

  def create

    user	=	User.find_by_username(login_params[:username])	
		if	user	&&	user.authenticate(login_params[:password])	
				session[:session_token]=	user.session_token
				@current_user	=	user	
				redirect_to	vendors_registration_path	
		else	
				flash[:notice]	=	'Invalid	username/password	combination'	
				redirect_to	login_path	
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
  	session[:session_token]=nil		
  	@current_user=nil
		flash[:notice]=	'You have logged out'
    redirect_to login_path
  end


end
