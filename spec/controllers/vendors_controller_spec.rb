require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
    describe "showing Vendor" do
        it "should call the model method that lists all Vendors" do
            post :show_vendor, :vendor => { :id => 123123, :number_i_booth => 123123, :number_o_booth => 123123 }
        end
    end
    describe "entering Vendor Registration" do
        it "should call the model method that creates User" do
            post :enter_registration, :user => { :username => "testing123", :email => "testing@testing.com",
                                     :password => "123123pasword!", :role => "admin" }
        end
        it "should call the model method that creates Vendor" do
            post :enter_registration, :vendor => { :company_name => "testing123", :product => "testing123",
                                                   :contact_name => "testing123", :address_street => "testing123",
                                                   :address_city => "testing123", :address_state => "testing123",
                                                   :address_zip => "12345", :phone => "1231231234", :fax => "1231231234",
                                                   :vendor_id => "testing123" }
        end
    end
    describe "entering Custom Booth Info" do
        it "should call the model method that finds Vendor Id" do
             #@fake_results  = [double(nil)]
             #expect(Vendor).to receive(:find_by).with({:vendor_id=>nil})
             #post :enter_custom_booth_info, :find_by => {:vendor_id => nil }
             #pending
        end
    end
    describe "entering Vendor Services" do
         it "should call the model method that finds Vendor Id" do
            #pending
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
    describe "confirming Vendor Info" do
    end
end
