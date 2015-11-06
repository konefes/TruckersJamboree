require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    describe "creating Session" do
        it "should call model method that checks for empty fields" do
             expect(assigns(:user)).to eq(nil)
        end
        it "should call model method that finds User by User Id" do
            post :create, :user => { :username => "testing123" }
        end
    end
end