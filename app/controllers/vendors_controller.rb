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
        # on submit got to enter_registration
    end
    
    def enter_registration
        # a vendor has entered their contact information
        # a vendor can be created from the data 
        # !!!!!code!!!!!!
        # redirect to booth
    end
    
    def booth
        # then the vendor item is passed to the booth screen
        # booth view is loaded
        # on this screen a vendor can select to enter custom booth information
        # on submit go to add_booth_info
    end
    
    def custom_booth
        # vendor id is passed in always
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
        # !!!!!code!!!!!
        # redirect to services
    end
    
    def enter_custom_booth_info
        # vendor id is passed in always
        # vendors have selected their custom booth space 
        # add custom booth information to the vendor
        # !!!!!code!!!!!
        # redirect to services
    end
    
    def services
        # vendor is then dirrected to the service view 
        # here they can select any required services that they might need
        # on submit go to services_entry
    end
    
    def enter_services
        # vendor id is passed in always
        # a vendor has now selected their booth and services options
        # attach that information to the vendors id
        # !!!!!code!!!!!
        # redirect to summary
    end
    
    def summary
        # render the summary view for the customer to verify data 
        # also this is where the vender will sign off on the input
        # also do a minimal check that the user is a human not a robot
        # there also needs to be an edit button 
    end
    
    def edit
        # vendor id sent in with all current information
        # this will have to be a form with all vendor editable data fields
        # on input create a hash[:id][:new value]
    end
    
    def enter_edit
        # the hash passed in from the edit view is parsed 
        # !!!!!code!!!!!
        # the vendor is redirected back to summary
    end
    
    def confirmation
        # the completed vendor profile should be eastablished by now
        # render a invoice sent to the attched email in the registration
        # !!!!!code!!!!!
        # pritn all the entered field for the vendor to see one last time
        # display a message in large text showing the vendor their submission has been recieved
    end
end