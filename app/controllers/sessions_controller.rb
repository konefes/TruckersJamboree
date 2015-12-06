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
				if @current_user.username == 'admin@example.com'
				  redirect_to admins_path
				else
				  redirect_to	home_path	
				end
		else	
				flash[:notice]	=	'Invalid username/password combination'	
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
  	session[:vendorNewRegistration] = 0
  	#VendorsController.session_reset()
  	@current_user=nil
		flash[:notice]=	'You have logged out'
    redirect_to login_path
  end


end
