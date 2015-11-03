class VendorsController < ApplicationController
    
    def index
        #
    end
    
    def show
        #
    end
    
    def show_vendor
        #vendorid = params[:id]
        @vendors = Vendor.all
    end
    
    def registration
        # called when a user identifies they want to register for a spot
        # a contact form is then displayed after this function
        
        # on submit goes to enter_registration
        
    end
    
    def enter_registration
        # a vendor has entered their contact information
        # a vendor can be created from the data 
        @user = User.create!(username: params["email"], role: "vendor", email: params["email"])
        Vendor.create(company_name: params["company_name"],
                        product: params["product"],
                        contact_name: params["contact_name"],
                        address_street: params["address_street"],
                        address_city: params["address_city"],
                        address_state: params["address_state"],
                        address_zip: params["address_zip"],
                        phone: params["phone"],
                        fax: params["fax"],
                        vendor_id: @user.id)
        # redirect to booth
        session[:user_id] = @user.id
        
        redirect_to '/vendors/booth'
        #redirect_to controller: 'vendors', action: 'booth', id: @user.id
    end
    
    def booth 
        #@company_name = Vendor.find_by(vendor_id: session[:user_id]).company_name
        # on this screen a vendor can select to enter custom booth information
        # on submit go to add_booth_info
    end
    
    def custom_booth 
        #@company_name = Vendor.find_by(vendor_id: session[:user_id]).company_name
        # if a vendor selected a custom space they will be redirected to custom_booth path
        # vendor still needs to be passed to this page
        # a user requires a custom booth instead of the pre displayed ones
        # a different form is generated to do custom booth displays
        # on submit go to add_booth_info
    end
    
    def enter_booth_info
        # vendor id is passed in always
        # vendors have selected their booth space 
        # add booth information to the vendor
        Vendor.update(number_i_booth: params["number_i_booth"],
                        number_o_booth: params["number_o_booth"],
                        booth_pref: params["booth_pref"],
                        booth_cost: params["booth_cost"])
        # redirect to services
        redirect_to '/vendors/services'
    end
    
    def enter_custom_booth_info
        # vendor id is passed in always
        # vendors have selected their custom booth space 
        # add custom booth information to the vendor
        # !!!!!code!!!!!
        # redirect to services
        redirect_to '/vendors/services'
    end
    
    def services
        # here they can select any required services that they might need
        # on submit go to services_entry
        #@company_name = Vendor.find_by(vendor_id: session[:user_id]).company_name
    end
    
    def enter_services
        # a vendor has now selected their booth and services options
        # attach that information to the vendors id
        Vendor.update(electric: params["electric"],
                        internet: params["internet"],
                        forklift: params["forklift"],
                        ext_chairs: params["ext_chairs"],
                        ext_tables: params["ext_tables"],
                        service_cost: params["service_cost"])
        # redirect to summary
        redirect_to '/vendors/summary'
    end
    
    def summary 
        # render the summary view for the customer to verify data 
        # also this is where the vender will sign off on the input
        # also do a minimal check that the user is a human not a robot
        # there also needs to be an edit button 
        #@user = User.find_by(id: session[:user_id])
        #@vendor = Vendor.find_by(vendor_id: session[:user_id])
    end
    
    def edit 
        # vendor id sent in with all current information
        # this will have to be a form with all vendor editable data fields
        #@user = User.find_by(id: session[:user_id])
        #@vendor = Vendor.find_by(vendor_id: session[:user_id])
    end
    
    def enter_edit
        # the hash passed in from the edit view is parsed 
        # !!!!!code!!!!!
        # the vendor is redirected back to summary
    end
    
    def confirmation 
        
        # the completed vendor profile should be eastablished by now
        # render a invoice sent to the attched email in the registration
        #@user = User.find_by(id: session[:user_id])
        #@vendor = Vendor.find_by(vendor_id: session[:user_id])
        # pritn all the entered field for the vendor to see one last time
        # display a message in large text showing the vendor their submission has been recieved
    end
end