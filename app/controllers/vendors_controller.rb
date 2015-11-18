class VendorsController < ApplicationController
    before_filter :set_current_user
    
    def index
      @vendors = Vendor.all 
      #test view in index. Will remove later
    end
    
    def show
        @vendor = Vendor.find(params[:id])
        render :partial=>'vendor', :object=>@vendor and return if request.xhr?
      #@vendors = Vendor.all 
      #test view in index. Will remove later
    end
    
    def show_vendor
        #vendorid = params[:id]
        @vendors = Vendor.all
        #will remove depending on option jquery
    end
    
    def registration
        # called when a user identifies they want to register for a spot
    end
    
    def enter_registration
            
        #Vendor.create(company_name: params["company_name"],
        #                product: params["product"],
        #                contact_name: params["contact_name"],
        #                address_street: params["address_street"],
        #                address_city: params["address_city"],
        #                address_state: params["address_state"],
        #                address_zip: params["address_zip"],
        #                phone: params["phone"],
        #                fax: params["fax"],
        #                vendor_id: @user.id)
        
        session[:company_name] = params["company_name"]
        session[:product] = params["product"]
        session[:contact_name] = params["contact_name"]
        session[:address_street] = params["address_street"]
        session[:address_city] = params["address_city"]
        session[:address_state] = params["address_state"]
        session[:address_zip] = params["address_zip"]
        session[:phone] = params["phone"]
        session[:fax] = params["fax"]
        session[:email] = params["email"] 
        
        if session[:edit] == 1
            redirect_to '/vendors/summary'
        else
            redirect_to '/vendors/booth'
        end
        #redirect_to controller: 'vendors', action: 'booth', id: @user.id
    end
    
    def booth 
        # on this screen a vendor can select to enter custom booth information
    end
    
    def custom_booth 
        # if a vendor selected a custom space they will be redirected to custom_booth path
    end
    
    def enter_booth_info 
        # add booth information to the vendor
        #Vendor.find_by(vendor_id: session[:user_id]).update(number_i_booth: params["number_i_booth"],
        #                                                    number_o_booth: params["number_o_booth"],
        #                                                    booth_cost: params["booth_cost"])
        session[:number_i_booth] = params["number_i_booth"]
        session[:number_o_booth] = params["number_o_booth"]
        session[:booth_cost] = params["booth_cost"]

        if session[:edit] == 1
            redirect_to '/vendors/summary'
        else
            redirect_to '/vendors/services'
        end
    end
    
    def enter_custom_booth_info
        # vendors have selected their custom booth space 
        #Vendor.find_by(vendor_id: session[:user_id]).update(booth_cost: params["booth_cost"])
        session[:booth_cost] = params["booth_cost"]
        
        if session[:edit] == 1
            redirect_to '/vendors/summary'
        else
            redirect_to '/vendors/services'
        end
    end
    
    def services
        # here they can select any required services that they might need
    end
    
    def enter_services
        # a vendor has now selected their booth and services options
        #Vendor.find_by(vendor_id: session[:user_id]).update(electric: params["electric"],
        #                                                    internet: params["internet"],
        #                                                    forklift: params["forklift"],
        #                                                    ext_chairs: params["ext_chairs"],
        #                                                    ext_tables: params["ext_tables"],
        #                                                    service_cost: params["service_cost"])
        
        session[:electric] = params["electric"]
        session[:internet] = params["internet"]
        session[:forklift] = params["forklift"]
        session[:ext_chairs] = params["ext_chairs"]
        session[:ext_tables] = params["ext_tables"]
        session[:service_cost] = params["service_cost"]
        
        redirect_to '/vendors/summary'
    end
    
    def summary
        # render the summary view for the customer to verify data 
        # also this is where the vender will sign off on the input
        # there also needs to be an edit button 
        #@vendor = session[:new_vendor]
    end
    
    def summary_change
        session[:edit] = 1
        if params[:page] == "contact"
            redirect_to "/vendors/registration"
        elsif params[:page] == "booth"
            redirect_to "/vendors/booth"
        elsif params[:page] == "services"
            redirect_to "/vendors/services"
        end
    end

    
    def confirmation 
        # the completed vendor profile should be eastablished by now
        # print all the entered field for the vendor to see one last time
        # display a message in large text showing the vendor their submission has been recieved
        Vendor.create(company_name: session[:company_name],
                        product: session[:product],
                        contact_name: session[:contact_name],
                        address_street: session[:address_street],
                        address_city: session[:address_city],
                        address_state: session[:address_state],
                        address_zip: session[:address_zip],
                        phone: session[:phone],
                        fax: session[:fax],
                        number_i_booth: session[:number_i_booth],
                        number_o_booth: session[:number_o_booth],
                        booth_cost: session[:booth_cost],
                        electric: session[:electric],
                        internet: session[:internet],
                        forklift: session[:forklift],
                        ext_chairs: session[:ext_chairs],
                        ext_tables: session[:ext_tables],
                        service_cost: session[:service_cost]
                        )
        session.destroy
        # send email with registration information
    end
end