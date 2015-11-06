require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "creating User" do
        it "should should call the model method that creates User" do
            post :create, :user => { :username => "testing123", :email => "testing@testing.com",
                                     :password => "123123pasword!", :role => "admin" }
        end
        it "should detect if User Id already exists" do
            expect { post :create, :user => {:user => :username } }.to change{ User.count }
        end
    end
end
