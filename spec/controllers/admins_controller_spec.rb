require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
    describe "edit a registration" do
        before :each do
            @fake_results = double('vendor1')
            allow(@fake_results).to receive(:company_name).and_return("a")
            allow(@fake_results).to receive(:product).and_return("a")
            allow(@fake_results).to receive(:contact_name).and_return("a")
            allow(@fake_results).to receive(:contact_title).and_return("a")
            allow(@fake_results).to receive(:address_street).and_return("a")
            allow(@fake_results).to receive(:address_city).and_return("a")
            allow(@fake_results).to receive(:address_state).and_return("a")
            allow(@fake_results).to receive(:address_zip).and_return("a")
            allow(@fake_results).to receive(:phone).and_return("a")
            allow(@fake_results).to receive(:email).and_return("a")
            allow(@fake_results).to receive(:booth_pref).and_return("a")
            allow(@fake_results).to receive(:number_i_booth).and_return("a")
            allow(@fake_results).to receive(:booth_i_cost).and_return("a")
            allow(@fake_results).to receive(:number_o_booth).and_return("a")
            allow(@fake_results).to receive(:booth_o_cost).and_return("a")
            allow(@fake_results).to receive(:length).and_return("a")
            allow(@fake_results).to receive(:width).and_return("a")
            allow(@fake_results).to receive(:booth_cost).and_return("a")
            allow(@fake_results).to receive(:custom_description).and_return("a")
            allow(@fake_results).to receive(:electric).and_return("a")
            allow(@fake_results).to receive(:electric_cost).and_return("a")
            allow(@fake_results).to receive(:ext_chairs).and_return("a")
            allow(@fake_results).to receive(:chair_cost).and_return("a")
            allow(@fake_results).to receive(:ext_tables).and_return("a")
            allow(@fake_results).to receive(:table_cost).and_return("a")
            allow(@fake_results).to receive(:service_cost).and_return("a")
            allow(@fake_results).to receive(:service_description).and_return("a")
            allow(@fake_results).to receive(:total_cost).and_return("a")
            allow(@fake_results).to receive(:authorize_sig).and_return("a")
            allow(@fake_results).to receive(:authorize_title).and_return("a")
            allow(@fake_results).to receive(:authorize_date).and_return("a")
        end
        it 'should call the model method returns the vendor being edited' do
            expect(Vendor).to receive(:find_by_id).with('123').and_return(@fake_results)
            post :change_vendor, {:vendor_id => '123', :page => "contact"}
        end
        it 'should redirect to the edit vendor contact page' do
            expect(Vendor).to receive(:find_by_id).with('123').and_return(@fake_results)
            post :change_vendor, {:vendor_id => '123', :page => "contact"}
            expect(response).to redirect_to('/vendors/registration')
        end
        it 'should redirect to the edit vendor booth page' do
            expect(Vendor).to receive(:find_by_id).with('123').and_return(@fake_results)
            post :change_vendor, {:vendor_id => '123', :page => "booth"}
            expect(response).to redirect_to('/vendors/booth')
        end
        it 'should redirect to the edit vendor services page' do
            expect(Vendor).to receive(:find_by_id).with('123').and_return(@fake_results)
            post :change_vendor, {:vendor_id => '123', :page => "services"}
            expect(response).to redirect_to('/vendors/services')
        end
    end
end
