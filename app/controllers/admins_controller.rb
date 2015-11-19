class AdminsController < ApplicationController
    before_filter :set_current_user
    
    def index
      @vendors = Vendor.all 
      #test view in index. Will remove later
    end
    
    def populate_list
      @vendors = sort_by_checkbox();
      render :partial=>'vendor_list', :object=>@vendors and return if request.xhr?
    end
    
    def print_list
      @vendors = sort_by_checkbox();
    end
end
