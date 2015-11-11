class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:username, :password, :email, :role)
  end

  def new
    # default: render 'new' template
  end

  def create

      message = ""
    
      @user=User.new(user_params)
      @user.valid?
      if !@user.errors[:username].empty?
        message+="User name has already been taken\n"
      end
      
      
      if message.empty?
        @user.save
        flash[:notice] = "New user #{@user.username} was successfully created."
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
