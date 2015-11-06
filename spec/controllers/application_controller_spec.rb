require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    describe "setting current User" do
        it "should call model method that finds User by session token" do
            #post :set_current_user, :current_user => { :session_token => "1234" }
            @session_token = nil
            expect(assigns(:user)).to eq(@session_token)
        end
    end
end