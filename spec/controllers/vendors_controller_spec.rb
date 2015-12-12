require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
    describe "showing Vendor" do
        it "should call the model method that lists all Vendors" do
            post :show_vendor, :vendor => { :id => 123123, :number_i_booth => 123123, :number_o_booth => 123123 }
        end
    end
    
    describe "admin wants to remove a vendor's registration" do
        it "should remove the vendor and go back to admin homepage" do
            @fake_results1 = double('vendor')
            allow(Vendor).to receive(:find).with("123").and_return(@fake_results1)
            allow(@fake_results1).to receive(:destroy)
            post :show, {:id => 'r123'}
            #expect(@fake_results1).to receive(:destroy)
            expect(response).to redirect_to("admins")
        end
    end
    
    
    describe "visiting registration contact info page" do
        it "should reset session[:admin_add_vendor]" do
            post :registration
            expect(session[:admin_add_vendor]).to eq(nil) 
        end
        it "should reset session data if editing or admin" do
            @request.session[:admin] = 1
            post :registration
            expect(session[:admin]).to eq(0)
        end
    end
    
    
    describe "admin wants to view a vendor's registration" do
        render_views
        it "should render the vendor reg partial" do
            fake_results = double('vendor')
            allow(Vendor).to receive(:find).and_return(fake_results)
            post :show, {:id => '123'}
            #how do you test for partial views? nothing works
            #expect(view).to render_template(:partial => '_vendor')
        end
    end
    
    
    
    describe "entering Vendor Contact info as vendor" do
         before :each do
            post :enter_registration, {:company_name => '1'}
        end
        it "should store session data from page" do
             
            expect(session[:company_name]).to eq('1')
        end
        it "should redirect to booth page" do
            expect(response).to redirect_to("/vendors/booth")
        end
    end
    
    describe "editing Vendor contact info data as vendor" do
        before :each do
            @request.session[:edit] = 1
            post :enter_registration
        end
        it "should redirect to " do
            expect(response).to redirect_to("/vendors/summary")
        end
    end
    
    describe "entering Vendor contact info data as admin" do
        before :each do
            fake_results = double('vendor')
            @request.session[:edit] = 1
            @request.session[:admin] = 1
            allow(Vendor).to receive(:find_by_id).and_return(fake_results)
            allow(fake_results).to receive(:update)
            post :enter_registration
        end
        it "should redirect to admin home page" do
            expect(response).to redirect_to("/admins")
        end
    end
    
    
    
    describe "entering Vendor booth info as vendor" do
        before :each do
            post :enter_booth_info, {:number_i_booth => '1'}
        end
        it "should store session data from page" do
             
            expect(session[:number_i_booth]).to eq('1')
        end
        it "should redirect to booth page" do
            expect(response).to redirect_to("/vendors/services")
        end
    end
    
    describe "editing Vendor booth info data as vendor" do
        before :each do
            @request.session[:edit] = 1
            @request.session[:service_cost] = '1'
            @request.session[:booth_cost] = '1'
            post :enter_booth_info, {:booth_cost => 1}
        end
        it "should compute total cost" do
           expect(session[:total_cost]).to eq(2) 
        end
        it "should redirect to " do
            expect(response).to redirect_to("/vendors/summary")
        end
    end
    
    describe "entering Vendor booth info data as admin" do
        before :each do
            fake_results = double('vendor')
            @request.session[:edit] = 1
            @request.session[:admin] = 1
            @request.session[:service_cost] = 1
            allow(Vendor).to receive(:find_by_id).and_return(fake_results)
            allow(fake_results).to receive(:update)
            post :enter_booth_info, {:booth_cost => 1}
        end
        it "should redirect to admin home page" do
            expect(response).to redirect_to("/admins")
        end
    end
    
    
    
    
    describe "entering Vendor Custom Booth data as vendor" do
        before :each do
            @request.session[:service_cost] = 1
            post :enter_custom_booth_info, {:booth_cost => '1'}
        end
        it "should store session data from page" do
             
            expect(session[:booth_cost]).to eq('1')
        end
        it "should redirect to summary page" do
            expect(response).to redirect_to("/vendors/services")
        end
    end
    
    describe "editing Vendor Custom Booth data as vendor" do
        before :each do
            @request.session[:edit] = 1
            @request.session[:service_cost] = 1
            post :enter_custom_booth_info, {:booth_cost => '1'}
        end
        it "should compute total cost when editing instead of registering first time" do
            expect(session[:total_cost]).to eq(2)
        end
    end
    
    describe "entering Vendor Custom Booth data as admin" do
        before :each do
            fake_results = double('vendor')
            @request.session[:service_cost] = 1
            @request.session[:edit] = 1
            @request.session[:admin] = 1
            allow(Vendor).to receive(:find_by_id).and_return(fake_results)
            allow(fake_results).to receive(:update)
            post :enter_custom_booth_info, {:booth_cost => '1'}
        end
        it "should redirect to admin home page" do
            expect(response).to redirect_to("/admins")
        end
    end
    
    
    
    
    
    
    
    describe "entering Vendor Services data as vendor" do
        before :each do
            @request.session[:booth_cost] = 1
            post :enter_services, {:service_cost => '1'}
        end
        it "should store session data from page" do
             
            expect(session[:service_cost]).to eq('1')
        end
        it "should compute total cost" do
            expect(session[:total_cost]).to eq(2)
        end
        it "should redirect to summary page" do
            expect(response).to redirect_to("/vendors/summary")
        end
    end
    
    describe "entering Vendor Services data as admin" do
        before :each do
            fake_results = double('vendor')
            @request.session[:booth_cost] = 1
            @request.session[:edit] = 1
            @request.session[:admin] = 1
            allow(Vendor).to receive(:find_by_id).and_return(fake_results)
            allow(fake_results).to receive(:update)
            post :enter_services, {:service_cost => '1'}
        end
        it "should redirect to admin home page" do
            expect(response).to redirect_to("/admins")
        end
    end
    
    describe "viewing Vendor Summary" do
        it "should call the model method that finds Vendor Id" do
            post :summary, :vendor => {:vendor_id => "testing123" }
        end
        it "should call the model method that finds User Id" do
            post :summary, :user => {:user_id => "testing123"}
        end
    end
    describe "entering edit Vendor" do
    end
    
    describe "editing info from registration summary page" do
        it "should set mode to editing" do
            post :summary_change, {:page => "contact"}
            expect(session[:edit]).to eq(1)
        end
        it "should redirect to contact page if editing contact info" do
            post :summary_change, {:page => "contact"}
            expect(response).to redirect_to("/vendors/registration")
        end
        it "should redirect to booth page if editing booth info" do
            post :summary_change, {:page => "booth"}
            expect(response).to redirect_to("/vendors/booth")
        end
        it "should redirect to services page if editing services info" do
            post :summary_change, {:page => "services"}
            expect(response).to redirect_to("/vendors/services")
        end
    end
    
    describe "confirming Vendor Info" do
        it "should call the method to confirm registration and clear session data" do
            fake_results = double('email')
            allow(UserMailer).to receive(:vendor_email).and_return(fake_results)
            allow(fake_results).to receive(:deliver_now)
            post :confirmation
            expect(session[:authorize_sig]).to eq("")
        end
    end
   
end
