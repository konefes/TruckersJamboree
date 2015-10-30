class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  def new
    # default: render 'new' template
  end

  def create

    begin
       @user=User.create_user!(user_params)
       flash[:notice] = "New user #{@user.username} was successfully created."
       redirect_to login_path
    rescue ActiveRecord::RecordInvalid => e #This section is to resolve the same username conflict
       flash[:notice] = "The User Id #{params[:user][:username]} already exists"
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
