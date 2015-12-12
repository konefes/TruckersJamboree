require 'rails_helper'

RSpec.describe VendorHomepageController, type: :controller do
    describe "Vendor Homepage View" do
        before :each do
            @fake_results = double('user')
            @request.session[:session_token] = 'losTuiAFQvwXxKT5MiI3KA==';
            allow(@fake_results).to receive(:id).and_return("1")
            allow(@fake_results).to receive(:username).and_return("a")
            allow(@fake_results).to receive(:password_digest).and_return("testtest")
            allow(@fake_results).to receive(:email).and_return("test1@test1.com")
            allow(@fake_results).to receive(:session_token).and_return("losTuiAFQvwXxKT5MiI3KA==")
            allow(@fake_results).to receive(:role).and_return("vendor")
        end
    
        it "should render vendor view after successful login" do
            allow(User).to receive(:find_by_session_token).with('losTuiAFQvwXxKT5MiI3KA==').and_return(@fake_results)
            post :index, {:session_token => "losTuiAFQvwXxKT5MiI3KA=="}
        end
    end 
    
    describe "Admin Homepage View" do
        before :each do
            @fake_results = double('user')
            @request.session[:session_token] = 'losTuiAFQvwXxKT5MiI3KA==';
            allow(@fake_results).to receive(:id).and_return("1")
            allow(@fake_results).to receive(:username).and_return("admin@example.com")
            allow(@fake_results).to receive(:password_digest).and_return("testtest")
            allow(@fake_results).to receive(:email).and_return("test@test.com")
            allow(@fake_results).to receive(:session_token).and_return("losTuiAFQvwXxKT5MiI3KA==")
            allow(@fake_results).to receive(:role).and_return("vendor")
        end
    
        it "should render admin view after successful login" do
            allow(User).to receive(:find_by_session_token).with('losTuiAFQvwXxKT5MiI3KA==').and_return(@fake_results)
            post :index, {:session_token => "losTuiAFQvwXxKT5MiI3KA=="}
        end
    end 
    
    describe "Admin Homepage View" do
        before :each do
            @fake_results = double('user')
            @request.session[:session_token] = nil;
            allow(@fake_results).to receive(:id).and_return("1")
            allow(@fake_results).to receive(:username).and_return("admin@example.com")
            allow(@fake_results).to receive(:password_digest).and_return("testtest")
            allow(@fake_results).to receive(:email).and_return("test@test.com")
            allow(@fake_results).to receive(:session_token).and_return("losTuiAFQvwXxKT5MiI3KA==")
            allow(@fake_results).to receive(:role).and_return("vendor")
        end
    
        it "should render login view after failed login" do
            allow(User).to receive(:find_by_session_token).with('').and_return(nil)
            post :index, {:session_token => ""}
        end
    end 
    
    
    describe "Make new registration from Vendor Homepage" do
        before :each do
            @fake_results = double('user')
            @request.session[:session_token] = 'losTuiAFQvwXxKT5MiI3KA==';
            allow(@fake_results).to receive(:id).and_return("1")
            allow(@fake_results).to receive(:username).and_return("tony")
            allow(@fake_results).to receive(:password_digest).and_return("testtest")
            allow(@fake_results).to receive(:email).and_return("test@test.com")
            allow(@fake_results).to receive(:session_token).and_return("losTuiAFQvwXxKT5MiI3KA==")
            allow(@fake_results).to receive(:role).and_return("vendor")
            
            @array = Array.new
            @fake_results2 = double('vendor')
            allow(@fake_results2).to receive(:id).and_return("2")
            allow(@fake_results2).to receive(:company_name).and_return("a")
            allow(@fake_results2).to receive(:product).and_return("a")
            allow(@fake_results2).to receive(:contact_name).and_return("a")
            allow(@fake_results2).to receive(:contact_title).and_return("a")
            allow(@fake_results2).to receive(:address_street).and_return("a")
            allow(@fake_results2).to receive(:address_city).and_return("a")
            allow(@fake_results2).to receive(:address_state).and_return("a")
            allow(@fake_results2).to receive(:address_zip).and_return("a")
            allow(@fake_results2).to receive(:phone).and_return("a")
            allow(@fake_results2).to receive(:email).and_return("test@test.com")
            allow(@fake_results2).to receive(:booth_pref).and_return("a")
            allow(@fake_results2).to receive(:number_i_booth).and_return("a")
            allow(@fake_results2).to receive(:booth_i_cost).and_return("a")
            allow(@fake_results2).to receive(:number_o_booth).and_return("a")
            allow(@fake_results2).to receive(:booth_o_cost).and_return("a")
            allow(@fake_results2).to receive(:length).and_return("a")
            allow(@fake_results2).to receive(:width).and_return("a")
            allow(@fake_results2).to receive(:booth_cost).and_return("a")
            allow(@fake_results2).to receive(:custom_description).and_return("a")
            allow(@fake_results2).to receive(:electric).and_return("a")
            allow(@fake_results2).to receive(:electric_cost).and_return("a")
            allow(@fake_results2).to receive(:ext_chairs).and_return("a")
            allow(@fake_results2).to receive(:chair_cost).and_return("a")
            allow(@fake_results2).to receive(:ext_tables).and_return("a")
            allow(@fake_results2).to receive(:table_cost).and_return("a")
            allow(@fake_results2).to receive(:service_cost).and_return("a")
            allow(@fake_results2).to receive(:service_description).and_return("a")
            allow(@fake_results2).to receive(:total_cost).and_return("a")
            allow(@fake_results2).to receive(:authorize_sig).and_return("a")
            allow(@fake_results2).to receive(:authorize_title).and_return("a")
            allow(@fake_results2).to receive(:authorize_date).and_return("a")
            @array.push @fake_results2
        end
    
        it "render an empty form if vendor doesn't have any registrations" do
            allow(User).to receive(:find_by_session_token).with('losTuiAFQvwXxKT5MiI3KA==').and_return(@fake_results)
            post :add_registration_with_defaults, {:session_token => "losTuiAFQvwXxKT5MiI3KA=="}
        end
        
        it "render a form with default values if vendor does have any registrations" do
            allow(User).to receive(:find_by_session_token).with('losTuiAFQvwXxKT5MiI3KA==').and_return(@fake_results)
            allow(Vendor).to receive(:where).with(email: @fake_results2.email).and_return(@array)
            allow(@array).to receive(:take).and_return(@fake_results2)
            allow(Vendor).to receive(:find_by_id).and_return(@fake_results2)
            post :add_registration_with_defaults, {:session_token => "losTuiAFQvwXxKT5MiI3KA=="}
        end
    end 
end
