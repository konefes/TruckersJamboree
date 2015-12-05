class VendorHomepageController < ApplicationController
    before_filter :set_current_user
    
    def index
      @current_user	||=	session[:session_token]	&& User.find_by_session_token(session[:session_token])	
      #vendorEmail = Vendor.where(id: params[:id])
      @vendors = Vendor.where(email: @current_user.email)
      #test view in index. Will remove later
    end
    

end
