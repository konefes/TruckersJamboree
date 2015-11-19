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
        session[:contact_title] = params["contact_title"]
        session[:address_street] = params["address_street"]
        session[:address_city] = params["address_city"]
        session[:address_state] = params["address_state"]
        session[:address_zip] = params["address_zip"]
        session[:phone] = params["phone"]
        session[:email] = params["email"] 
        if session[:edit] != 1
            session[:booth_pref] = true
            session[:number_i_booth] = "0"
            session[:booth_i_cost] = "0"
            session[:number_o_booth] = "0"
            session[:booth_o_cost] = "0"
            session[:width] = "0"
            session[:length] = "0"
            session[:booth_cost] = "0"
            session[:electric] = "0"
            session[:electric_cost] = "0"
            session[:ext_chairs] = "0"
            session[:table_cost] = "0"
            session[:ext_tables] = "0"
            session[:chair_cost] = "0"
            session[:service_cost] = "0"
            session[:service_description] = "Need any additional services, request it here!"
            session[:custom_description] = "Short description and dimensions of your display items"
        else
        end
        
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
        session[:booth_pref] = false
        session[:length] = 0;
        session[:width] = 0;
        session[:number_i_booth] = params["number_i_booth"]
        session[:booth_i_cost] = params["booth_i_cost"]
        session[:number_o_booth] = params["number_o_booth"]
        session[:booth_o_cost] = params["booth_o_cost"]
        session[:booth_cost] = params["booth_cost"]

        if session[:edit] == 1
            @total = Integer(session[:service_cost]) + Integer(session[:booth_cost])
            session[:total_cost] = @total
            redirect_to '/vendors/summary'
        else
            redirect_to '/vendors/services'
        end
    end
    
    def enter_custom_booth_info
        # vendors have selected their custom booth space 
        #Vendor.find_by(vendor_id: session[:user_id]).update(booth_cost: params["booth_cost"])
        session[:booth_pref] = true
        session[:number_i_booth] = 0
        session[:booth_i_cost] = 0
        session[:number_o_booth] = 0
        session[:booth_o_cost] = 0
        session[:width] = params["width"]
        session[:length] = params["length"]
        session[:booth_cost] = params["booth_cost"]
        session[:custom_description] = params["custom_description"]
        
        if session[:edit] == 1
            @total = Integer(session[:service_cost]) + Integer(session[:booth_cost])
            session[:total_cost] = @total
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
        session[:electric_cost] = params["electric_cost"]
        session[:ext_chairs] = params["ext_chairs"]
        session[:table_cost] = params["table_cost"]
        session[:ext_tables] = params["ext_tables"]
        session[:chair_cost] = params["chair_cost"]
        session[:service_cost] = params["service_cost"]
        session[:service_description] = params["service_description"]
        @total = Integer(params["service_cost"]) + Integer(session[:booth_cost])
        session[:total_cost] = @total
        
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
        session[:authorize_sig] = "authorize_sig"
        session[:authorize_title] = "authorize_title"
        session[:authorize_date] = "authorize_date"
        Vendor.create(company_name: session[:company_name],
                        product: session[:product],
                        contact_name: session[:contact_name],
                        contact_title: session[:contact_title],
                        address_street: session[:address_street],
                        address_city: session[:address_city],
                        address_state: session[:address_state],
                        address_zip: session[:address_zip],
                        phone: session[:phone],
                        number_i_booth: session[:number_i_booth],
                        booth_i_cost: session[:booth_i_cost],
                        number_o_booth: session[:number_o_booth],
                        booth_o_cost: session[:booth_o_cost],
                        booth_cost: session[:booth_cost],
                        custom_description: session[:custom_description],
                        electric: session[:electric],
                        electric_cost: session[:electric_cost],
                        ext_chairs: session[:ext_chairs],
                        chair_cost: session[:chair_cost],
                        ext_tables: session[:ext_tables],
                        table_cost: session[:table_cost],
                        service_cost: session[:service_cost],
                        service_description: session[:service_description],
                        total_cost: session[:total_cost],
                        authorize_sig: session[:authorize_sig],
                        authorize_title: session[:authorize_title],
                        authorize_date: session[:authorize_date]
                        )
        session.destroy
        # send email with registration information
    end
end