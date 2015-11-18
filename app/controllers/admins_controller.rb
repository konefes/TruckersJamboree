class AdminsController < ApplicationController
    before_filter :set_current_user
    
    def index
      @vendors = Vendor.all 
      #test view in index. Will remove later
    end
end
