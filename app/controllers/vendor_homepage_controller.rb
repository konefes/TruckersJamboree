class VendorHomepageController < ApplicationController
    before_filter :set_current_user
    
    def index
      @current_user	||=	session[:session_token]	&& User.find_by_session_token(session[:session_token])	
      #vendorEmail = Vendor.where(id: params[:id])
      if !@current_user
        redirect_to login_path
      else
        @vendors = Vendor.where(email: @current_user.email)
      end
    end
    
    def add_registration_with_defaults
      @current_user	||=	session[:session_token]	&& User.find_by_session_token(session[:session_token])	
      @vendors = Vendor.where(email: @current_user.email)
      if !(@vendors.take)
        redirect_to vendors_registration_path
      else
        @edit_vendor = Vendor.find_by_id(@vendors.take.id)
        session[:vendorNewRegistration] = 1
        session[:company_name] = @edit_vendor.company_name
        session[:product] = @edit_vendor.product
        session[:contact_name] = @edit_vendor.contact_name
        session[:contact_title] = @edit_vendor.contact_title
        session[:address_street] = @edit_vendor.address_street
        session[:address_city] = @edit_vendor.address_city
        session[:address_state] = @edit_vendor.address_state
        session[:address_zip] = @edit_vendor.address_zip
        session[:phone] = @edit_vendor.phone
        session[:email] = @edit_vendor.email
        redirect_to vendors_registration_path
      end
    end
  
end
