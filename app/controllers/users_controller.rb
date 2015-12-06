class UsersController < ApplicationController
  before_filter	:set_current_user,	:only=>	['show',	'edit',	'update',	'delete']	

  def user_params
    params.require(:user).permit(:username, :password, :email, :role)
  end

  def new
    # default: render 'new' template
  end

  def create

      message = "User did not save"
    
      @user=User.new(user_params)
      @user.valid?
      if !@user.errors[:username].grep(/^can't be blank/).empty?
        message+="User name field cannot be left blank. \n"
      elsif !@user.errors[:username].grep(/^has already been taken/).empty?
        message+="User name has already been taken. \n"
      end
      
      
      if !@user.errors[:password].grep(/^can't be blank/).empty?
        message+="Password field cannot be left blank. \n"
      elsif !@user.errors[:password].grep(/^is too short/).empty?
        message+="Password is too short, minimum is 6 characters. \n"
      end
      
      
      if !@user.errors[:email].grep(/^can't be blank/).empty?
        message+="Email field cannot be left blank. \n"
      elsif !@user.errors[:email].grep(/^is invalid/).empty?
        message+="Email is not in correct format. \n"
      end
      
      
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
        #@user = User.create_user(user_params) #generate random session token
        flash[:notice] = "New user #{@user.username} was successfully created. Welcome email sent."
        redirect_to login_path
      else
       flash[:notice] = message
       redirect_to new_user_path
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
  end


end
