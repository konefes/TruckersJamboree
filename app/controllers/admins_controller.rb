class AdminsController < ApplicationController
    before_filter :set_current_user
    
    def index
      @current_user	||=	session[:session_token]	&& User.find_by_session_token(session[:session_token])	
      #vendorEmail = Vendor.where(id: params[:id])
      if !@current_user
        redirect_to login_path
      elsif @current_user.username != 'admin@example.com'
        redirect_to home_path
      else
        @vendors = Vendor.order(:company_name)
      end
      #test view in index. Will remove later
    end
    
    def populate_list
      @vendors = sort_by_checkbox();
      render :partial=>'vendor_list', :object=>@vendors and return if request.xhr?
    end
    
    def print_list
      @vendors = sort_by_checkbox();
    end
    
    def change_vendor
      @edit_vendor = Vendor.find_by_id(params[:vendor_id])
      session[:admin] = 1
      session[:edit] = 1
      session[:vendor_id] = params[:vendor_id]
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
      session[:booth_pref] = @edit_vendor.booth_pref
      session[:number_i_booth] = @edit_vendor.number_i_booth
      session[:booth_i_cost] = @edit_vendor.booth_i_cost
      session[:number_o_booth] = @edit_vendor.number_o_booth
      session[:booth_o_cost] = @edit_vendor.booth_o_cost
      session[:length] = @edit_vendor.length
      session[:width] = @edit_vendor.width
      session[:booth_cost] = @edit_vendor.booth_cost
      session[:custom_description] = @edit_vendor.custom_description
      session[:electric] = @edit_vendor.electric
      session[:electric_cost] = @edit_vendor.electric_cost
      session[:ext_chairs] = @edit_vendor.ext_chairs
      session[:chair_cost] = @edit_vendor.chair_cost
      session[:ext_tables] = @edit_vendor.ext_tables
      session[:table_cost] = @edit_vendor.table_cost
      session[:service_cost] = @edit_vendor.service_cost
      session[:service_description] = @edit_vendor.service_description
      session[:total_cost] = @edit_vendor.total_cost
      session[:authorize_sig] = @edit_vendor.authorize_sig
      session[:authorize_title] = @edit_vendor.authorize_title
      session[:authorize_date] = @edit_vendor.authorize_date
      if params[:page] == "contact"
          redirect_to "/vendors/registration"
      elsif params[:page] == "booth"
          redirect_to "/vendors/booth"
      elsif params[:page] == "services"
          redirect_to "/vendors/services"
      end
    end
end
